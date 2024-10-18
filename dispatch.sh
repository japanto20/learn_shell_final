source common.sh

echo -e "$color Copy Dispatch Service File $no_color"
cp dispatch.service /etc/systemd/system/dispatch.service

echo -e "$color Copy Install golang $no_color"
dnf install golang -y

echo -e "$color Add app user $no_color"
useradd roboshop

echo -e "$color Create App Directory $no_color"
rm -rf /app
mkdir /app

echo -e "$color Download App Content $no_color"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip
cd /app

echo -e "$color Extract App content $no_color"
unzip /tmp/dispatch.zip

echo -e "$color Download App Dependencies $no_color"
go mod init dispatch
go get
go build

echo -e "$color Start Application Service $no_color"
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch