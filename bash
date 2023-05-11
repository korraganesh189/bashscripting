Bash Scripting task:
====================
1) Create on Bash script to check if a directory is available or not.
#!/bin/bash

# set the directory path
directory="/root/tata"

# check if the directory exists
if [ -d "$directory" ]; then
  echo "Directory exists"
else
  echo "Directory does not exist"
fi

2. Create a bash script which will create multiple files
#!/bin/bash

# set the number of files to create
num_files=10

# set the file name prefix
file_prefix="file_"

# loop through and create the files
for ((i=1; i<=$num_files; i++)); do
  touch "${file_prefix}${i}.txt"
done

# print confirmation message
echo "Created $num_files files with prefix $file_prefix"

3. Create a bash script to take backup of a directory
#!/bin/bash

# set the directory to backup
backup_dir="/root/school"

# set the backup directory name and location
backup_location="/root/school/backup_file1"
backup_name="backup_$(date +%Y%m%d_%H%M%S).tar.gz"
backup_file="$backup_location/$backup_name"

# create the backup directory if it does not exist
mkdir -p "$backup_location"

# create the backup archive
tar -czf "$backup_file" "$backup_dir"

# print confirmation message
echo "Backup of $backup_dir created at $backup_file"

4. Create a bash script to install nginx in ec2 server.
#!/bin/bash
yum update -y
yum install nginx -y
systemctl start nginx
systemctl enable nginx
echo "installation successfull"
5. Create a bash script to install ApacheTomcat in ec2 server.
#!/bin/bash

# update the package list
sudo yum update

# install Java
sudo yum install java-1.8.0-openjdk-devel

# download and extract Apache Tomcat
wget https://archive.apache.org/dist/tomcat/tomcat-9/v9.0.54/bin/apache-tomcat-9.0.54.tar.gz
sudo tar xzf apache-tomcat-9.0.54.tar.gz -C /opt/

# create a symbolic link to the Tomcat directory
sudo ln -s /opt/apache-tomcat-9.0.54 /opt/tomcat

# create a Tomcat user
sudo useradd -r tomcat
sudo chown -R tomcat:tomcat /opt/tomcat

# create a systemd service file for Tomcat
sudo tee /etc/systemd/system/tomcat.service <<EOF
[Unit]
Description=Apache Tomcat 9
After=syslog.target network.target

[Service]
Type=forking

Environment=JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk
Environment=CATALINA_PID=/opt/tomcat/temp/tomcat.pid
Environment=CATALINA_HOME=/opt/tomcat
Environment=CATALINA_BASE=/opt/tomcat
Environment='CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC'

ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh

User=tomcat
Group=tomcat
UMask=0007
RestartSec=10
Restart=always

[Install]
WantedBy=multi-user.target
EOF

# reload the systemd daemon and start the Tomcat service
sudo systemctl daemon-reload
sudo systemctl start tomcat

# enable the Tomcat service to start on boot
sudo systemctl enable tomcat

# print confirmation message
echo "Apache Tomcat installed and started"
6. Create a bash script to check list if nginx service is running or not,if not running
   then script should start the service.
#!/bin/bash

# check if the Nginx service is running
if sudo systemctl is-active nginx > /dev/null; then
    echo "Nginx service is running"
else
    echo "Nginx service is not running. Starting the service..."
    sudo systemctl start nginx
    echo "Nginx service has been started"
fi
7. Create a bash script for calculator.

#!/bin/bash

# prompt the user to enter the first number
echo "10:"
read num1

# prompt the user to enter the second number
echo "20:"
read num2

# prompt the user to enter the operation to perform
echo "Enter the operation to perform (+, -, *, /):"
read operation

# perform the calculation based on the operation
case $operation in
    +)
        result=$((num1 + num2))
        ;;
    -)
        result=$((num1 - num2))
        ;;
    \*)
        result=$((num1 * num2))
        ;;
    /)
        result=$((num1 / num2))
        ;;
    *)
        echo "Invalid operation"
        exit 1
        ;;
esac

# print the result
echo "Result: $result"
8. Create a bash script to check if directory is avaialble or not,if not then create a directory.
#!/bin/bash

# prompt the user to enter the directory path
echo "Enter the directory path:"
read dir_path

# check if the directory exists
if [ -d "$dir_path" ]; then
    echo "Directory already exists"
else
    echo "Directory does not exist. Creating the directory..."
    mkdir -p "$dir_path"
    echo "Directory has been created"
fi
9.  Create bash script to delete last 3 lines for a file.
#!/bin/bash

# prompt the user to enter the file path
echo "Enter the file path:"
read file_path

# check if the file exists
if [ ! -f "$file_path" ]; then
    echo "File does not exist"
    exit 1
fi

# delete the last 3 lines of the file
sed -i '$d' "$file_path"
sed -i '$d' "$file_path"
sed -i '$d' "$file_path"

echo "Last 3 lines of the file have been deleted" 
or used this single command
sed -i ':a;$d;N;51,$!ba;P;D' file.txt
or this 
tail -n 3 "/root/script/last3linefile.txt" | wc -c | xargs -I {} truncate "/root/script/last3linefile.txt" -s -{}



