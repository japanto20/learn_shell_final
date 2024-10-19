source common.sh
app_name=dispatch

echo -e "$color Copy Dispatch Service File $no_color"
cp dispatch.service /etc/systemd/system/dispatch.service
echo $?

echo -e "$color Copy Install golang $no_color"
dnf install golang -y
echo $?

app_prerequisites

echo -e "$color Download App Dependencies $no_color"
go mod init dispatch
go get
go build
echo $?

echo -e "$color Start Application Service $no_color"
systemctl daemon-reload
systemctl enable dispatch
systemctl start dispatch
echo $?