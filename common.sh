color="\e[36m"
no_color="\e[0m"
log_file=/tmp/roboshop.log
rm-f $log_file

app_prerequisites() {
  echo -e "$color Add app user $no_color"
  useradd roboshop &>>$log_file
  echo $?

  echo -e "$color Create App Directory $no_color"
  rm -rf /app &>>$log_file
  mkdir /app &>>$log_file
  echo $?

  echo -e "$color Download App Content $no_color"
  curl -L -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip &>>$log_file
  echo $?

  cd /app

  echo -e "$color Extract App content $no_color"
  unzip /tmp/$app_name.zip &>>$log_file
  echo $?
}