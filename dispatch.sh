echo -e "\e[35m Copy Dispatch Service File \e[0m"
cp dispatch.service /etc/systemd/system/dispatch.service

echo -e "\e[35m Copy Install golang\e[0m"
dnf install golang -y

echo -e "\e[35m Add app user \e[0m"
useradd roboshop

echo -e "\e[35m Create App Directory \e[0m"
mkdir /app

echo -e "\e[35m Download App Content \e[0m"
curl -L -o /tmp/dispatch.zip https://roboshop-artifacts.s3.amazonaws.com/dispatch-v3.zip
cd /app

echo -e "\e[35m Extract App content \e[0m"
unzip /tmp/dispatch.zip

echo -e "\e[35m Download App Dependencies\e[0m"
go mod init dispatch
go get
go build

echo -e "\e[35m Start Application Service \e[0m"
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch