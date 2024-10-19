source common.sh
app_name=shipping

if [ -z "$1" ]; then
  echo Input MySql Root Pasword is missing
  exit 1
fi

MYSQL_ROOT_PASSWORD=$1

maven_setup