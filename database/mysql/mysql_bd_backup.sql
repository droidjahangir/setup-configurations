#!/bin/sh
today=$(date +"%Y%m%d")

host="localhost"
user="root"
password="4tugboat"

basePath="/scripts/"
dbinfo="${basePath}db.txt"

savePath="${basePath}${today}/"
logFile="${basePath}log.txt"
skipdb="Database|information_schema|performance_schema|mysql|sys"

echo "****** || DB Comparing script is running || ******" > "$logFile"

# Fetch databases and exclude system databases
mysql -u "$user" -p"$password" -h "$host" -e "show databases;" | grep -Ev "$skipdb" > "$dbinfo"

# Ensure save directory exists
mkdir -p "$savePath"

# Read database list from dbinfo
while read -r dbname; do
    echo "DB :: $dbname" >> "$logFile"

    # Create directory for each database
    mkdir -p "$savePath$dbname"

    # Get list of tables for the current database
    mysql -u "$user" -p"$password" -h "$host" -e "use $dbname; show tables;" | grep -Ev "Tables_in_$dbname" > "$savePath$dbname/$dbname.txt"

    # Iterate over each table
    while read -r table; do
        echo "\t\t Now From DB :: $dbname Table :: $table" >> "$logFile"

        # Perform database table dump and compress it
        mysqldump -u "$user" -p"$password" -h "$host" "$dbname" "$table" | gzip > "$savePath$dbname/$table.sql.gz"

        if [ $? -eq 0 ]; then
            echo "\t\t From DB :: $dbname table :: $table Completed." >> "$logFile"
        else
            echo "\t\t Failed to dump table $table from DB $dbname" >> "$logFile"
        fi
    done < "$savePath$dbname/$dbname.txt"

    echo "\tFor DB :: $dbname Completed !!" >> "$logFile"
done < "$dbinfo"

echo " || DB Backup Script successfully runs || " >> "$logFile"

# Send a notification via Telegram
curl -X POST "https://api.telegram.org/bot6495054060:AAGmf_mErUwKqnzpW8qsyQGm-Hb3uoxpzjc/sendMessage" \
    -H 'Content-Type: application/json' \
    -d '{"chat_id": "5056854717", "text": "NPF-ICTD-DB-1: DB Backup Script successfully runs"}'
