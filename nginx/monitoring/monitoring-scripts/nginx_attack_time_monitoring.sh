#!/bin/bash

# Function to get timestamp from X minutes ago
get_minutes_ago() {
    local minutes=$1
    date -d "$minutes minutes ago" +[%d/%b/%Y:%H:%M:%S
}

# Function to monitor attacks in last X minutes
monitor_time_window() {
    local minutes=$1
    local time_threshold=$(get_minutes_ago $minutes)
    echo "=== Attack Report for Last $minutes Minutes (since $time_threshold) ==="

    echo -e "\nTop IPs by request frequency in last $minutes minutes:"
    awk -v threshold="$time_threshold" '
        $4 >= threshold {
            print $1
        }
    ' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

    echo -e "\nTop 4xx errors by IP in last $minutes minutes:"
    awk -v threshold="$time_threshold" '
        $4 >= threshold && $9 >= 400 && $9 < 500 {
            print $1 " - " $9 " - " $7
        }
    ' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

    echo -e "\nPotential brute force attempts (401/403) in last $minutes minutes:"
    awk -v threshold="$time_threshold" '
        $4 >= threshold && ($9 == 401 || $9 == 403) {
            print $1 " - " $9 " - " $7
        }
    ' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

    echo -e "\nSuspicious request patterns in last $minutes minutes:"
    awk -v threshold="$time_threshold" '
        $4 >= threshold && tolower($7) ~ /(union|select|insert|delete|update|admin|wp-login|\.php)/ {
            print $1 " - " $7
        }
    ' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

    echo -e "\nRequests per minute in last $minutes minutes:"
    awk -v threshold="$time_threshold" '
        $4 >= threshold {
            gsub(/[[\]]/, "", $4);
            split($4, dt, ":");
            minute = dt[1] ":" dt[2];
            count[minute]++;
        }
        END {
            for (min in count) {
                print count[min] " requests at " min
            }
        }
    ' /var/log/nginx/access.log | sort -k5,5 -k6,6
}

# Function to monitor current attacks/suspicious activities
monitor_attacks() {
    echo "=== Current Attack Monitoring ==="

    echo -e "\nTop IPs by request frequency (potential DDoS):"
    awk '{print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

    echo -e "\nTop IPs causing 4xx errors (potential scanners):"
    awk '$9 >= 400 && $9 < 500 {print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

    echo -e "\nTop IPs with 403/401 errors (potential brute force):"
    awk '$9 == 403 || $9 == 401 {print $1}' /var/log/nginx/access.log | sort | uniq -c | sort -nr | head -n 10

    echo -e "\nSuspicious patterns (SQL injection, admin pages, etc.):"
    grep -i "union\|select\|insert\|delete\|update\|admin\|wp-login\|\.php" /var/log/nginx/access.log |
    awk '{print $1 " - " $7}' | sort | uniq -c | sort -nr | head -n 10
}

# Function for real-time monitoring
watch_realtime() {
    echo "Starting real-time attack monitoring (refresh every 10 seconds)..."
    while true; do
        clear
        date
        monitor_attacks
        sleep 10
    done
}

# Function to validate if input is a positive integer
is_positive_integer() {
    [[ "$1" =~ ^[0-9]+$ ]] && [ "$1" -gt 0 ]
}

# Function to show usage
show_usage() {
    echo "Usage: $0 [OPTION]"
    echo "Options:"
    echo "  --time TIME, -t TIME : Show attack report for last TIME minutes (e.g., -t 10 for last 10 minutes)"
    echo "  --realtime, -r       : Monitor attacks in real-time (10s refresh)"
    echo "  --once, -o          : Show current attack statistics once"
    echo "  --help, -h          : Show this help message"
    echo ""
    echo "Examples:"
    echo "  $0 -t 10            # Show report for last 10 minutes"
    echo "  $0 -t 20            # Show report for last 20 minutes"
    echo "  $0 --time 30        # Show report for last 30 minutes"
}

# Check if log file exists
if [ ! -f /var/log/nginx/access.log ]; then
    echo "Error: Nginx access log file not found at /var/log/nginx/access.log"
    exit 1
fi

# Main script
case "$1" in
    "--time"|"-t")
        if [ -z "$2" ]; then
            echo "Error: Time parameter is required"
            show_usage
            exit 1
        fi
        if ! is_positive_integer "$2"; then
            echo "Error: Time must be a positive integer"
            exit 1
        fi
        monitor_time_window "$2"
        ;;
    "--realtime"|"-r")
        watch_realtime
        ;;
    "--once"|"-o")
        monitor_attacks
        ;;
    "--help"|"-h")
        show_usage
        ;;
    *)
        show_usage
        exit 1
        ;;
esac