echo "update ssh"
mkdir /home/runner/.ssh
curl -o /home/runner/.ssh/id_rsa https://gitee.com/saintvamp/publick_rsa/raw/master/npw
chmod 600 /home/runner/.ssh/id_rsa
echo "update ssh done"
