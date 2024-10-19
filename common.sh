color="\e[36m"
no_color="\e[0m"

app_prerequisites() {
  echo -e "$color Add app user $no_color"
  useradd roboshop
  echo$?

  echo -e "$color Create App Directory $no_color"
  rm -rf /app
  mkdir /app
  echo$?

  echo -e "$color Download App Content $no_color"
  curl -L -o /tmp/$app_name.zip https://roboshop-artifacts.s3.amazonaws.com/$app_name-v3.zip
  echo$?

  cd /app

  echo -e "$color Extract App content $no_color"
  unzip /tmp/$app_name.zip
  echo$?
}