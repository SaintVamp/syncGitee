project_name=$1
echo "update ssh"
mkdir /home/runner/.ssh
curl -o /home/runner/.ssh/id_rsa https://gitee.com/saintvamp/publick_rsa/raw/master/npw
chmod 600 /home/runner/.ssh/id_rsa
echo "update ssh done"
echo "clone github"
cd /home/runner/
mkdir temp_d
cd /home/runner/temp_d
mkdir github
cd github
git clone https://github.com/SaintVamp/$project_name.git
echo "clone github down"
echo "clone gitee"
cd /home/runner/temp_d
mkdir gitee
cd gitee
git clone https://gitee.com/saintvamp/$project_name.git
echo "clone gitee down"
pwd
echo "rm gitee git"
rm -rf $project_name/.git
echo "rm gitee git down"
echo "cp gitee to github"
cp -r /home/runner/temp_d/gitee/$project_name/ /home/runner/temp_d/github/
echo "cp gitee to github down"
cd /home/runner/temp_d/github/$project_name
echo "git add"
ls -al
ls | xargs -i git add -v {}
echo "git add down"
git config --global user.email "saint-wp@163.com"
git config --global user.name "sv-action"
git config --global core.editor "vi"
need_commit=$(git status | grep -c "nothing to commit")
if [ $need_commit -eq 0 ] ;then
  git commit -m "merge gitee"
  echo yes |git push git@github.com:SaintVamp/$project_name.git
else
  echo "nothing to commit"
fi
