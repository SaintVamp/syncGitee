mkdir /home/runner/.ssh
curl -o /home/runner/.ssh/id_rsa https://gitee.com/saintvamp/publick_rsa/raw/master/npw
chmod 600 /home/runner/.ssh/id_rsa
cd /home/runner/
mkdir temp_d
cd /home/runner/temp_d
mkdir github
cd github
git clone https://github.com/SaintVamp/test_sync.git
cd /home/runner/temp_d
mkdir gitee
cd gitee
git clone https://gitee.com/saintvamp/test_sync.git
rm -rf test_sync/.git
cp -r /home/runner/temp_d/gitee/test_sync/ /home/runner/temp_d/github/
cd /home/runner/temp_d/github/test_sync
ls |xargs -i git add -v {}
git config --global user.email "saint-wp@163.com"
git config --global user.name "sv-action"
git config --global core.editor "vi"
need_commit=$(git status | grep -c "nothing to commit")
if [ $need_commit -eq 0 ] ;then
  git commit -m "merge gitee"
  echo yes |git push git@github.com:SaintVamp/test_sync.git
else
  echo "nothing to commit"
fi
