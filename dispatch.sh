source common.sh
app_name=dispatch


print_heading "Copy Dispatch Service File"
cp dispatch.service /etc/systemd/system/dispatch.service &>>$log_file
echo $?

print_heading "Copy Install golang r"
dnf install golang -y &>>$log_file
echo $?

app_prerequisites

print_heading "Download App Dependencies"
go mod init dispatch &>>$log_file
go get &>>$log_file
go build &>>$log_file
echo $?

print_heading "Start Application Service"
systemctl daemon-reload &>>$log_file
systemctl enable dispatch &>>$log_file
systemctl start dispatch &>>$log_file
echo $?