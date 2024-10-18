source common.sh
app_name=payment

echo -e "$color Copy payment Service File $no_color"

cp payment.service /etc/systemd/system/payment.service

echo -e "$color Install Python $no_color"
dnf install python3 gcc python3-devel -y

app_prerequisites

echo -e "$color Download App Dependencies $no_color"
cd /app
pip3 install -r requirements.txt

echo -e "$color Start App Service $no_color"
systemctl daemon-reload
systemctl enable payment
systemctl start payment