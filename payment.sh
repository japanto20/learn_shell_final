source common.sh

echo -e "$color Copy payment Service File $no_color"

cp payment.service /etc/systemd/system/payment.service

echo -e "$color Install Python $no_color"
dnf install python3 gcc python3-devel -y

echo -e "$color Add App user $no_color"
useradd roboshop

echo -e "$color Create App Directory $no_color"
rm -rf/app
mkdir /app

echo -e "$color CDownload App content $no_color"
curl -L -o /tmp/payment.zip https://roboshop-artifacts.s3.amazonaws.com/payment-v3.zip
cd /app

echo -e "$color Extract App content $no_color"
unzip /tmp/payment.zip

echo -e "$color Download App Dependencies $no_color"
cd /app
pip3 install -r requirements.txt

echo -e "$color Start App Service $no_color"
systemctl daemon-reload
systemctl enable payment
systemctl start payment