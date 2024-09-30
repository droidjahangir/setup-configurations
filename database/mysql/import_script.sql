#!/bin/sh

host="localhost"
user="root"
# password="4tugboat" # Uncomment this if not using .my.cnf for credentials

basePath="/scripts/20240822/"
dbinfo="${basePath}db.txt"
savePath="${basePath}"

echo "****** || DB Import script is running || ******"

# Read the database names from db.txt
var=$(cat "$dbinfo")

for db in $var;
do
    echo "Creating DB :: $db"

    # Create the database
    mysql -u "$user" -p"$password" -h "$host" -e "create database IF NOT EXISTS $db;"
    if [ $? -eq 0 ]; then
        echo "Database $db created or already exists."
    else
        echo "Error creating database $db"
        continue
    fi

    # Read the tables for this database
    tableList=$(cat "$savePath$db/$db.txt")

    for table in $tableList;
    do
        echo "\t\t Now importing table :: $table"

        # Decompress and import the SQL file
        zcat "$savePath$db/$table.sql.gz" | mysql -u "$user" -p"$password" -h "$host" "$db"
        if [ $? -eq 0 ]; then
            echo "\t\t Table $table imported successfully."
        else
            echo "\t\t Error importing table $table in DB $db."
        fi
    done

    echo "\t Importing DB :: $db Completed !!"
done

echo " || DB Import Script successfully ran || "
