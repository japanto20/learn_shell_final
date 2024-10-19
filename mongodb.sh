source common.sh
app_name=mongodb

print_heading "Copy mongodb repo file"
cp mongodb.repo /etc/yum.repos.d/mongodb.repo &>>$log_file
status_check $?

print_heading "INstall mongodb server"
dnf install mongodb-org -y &>>$log_file
status_check $?


print_heading "Update MongoDb Kisten address"
sed -i -e 's/127.0.0.1/0.0.0.0/' /etc/mongod.conf &>>$log_file
status_check $?

print_heading "Start MongoDB Service"
systemctl enable mongod &>>$log_file
systemctl restart mongod &>>$log_file
status_check $?