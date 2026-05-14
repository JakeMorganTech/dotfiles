# How to Configure Git SSH On Linux

1. Generate SSH key

ssh-keygen

2. Find public SSH key file

ll ~/.ssh/

3. cat public SSH key file

cat ~/.ssh/id_XXXX.pub

4. Add SSH key file to github account

go to github.com > Account Settings > SSH 

Add contents from cat view of ssh file

5. config git user name

git config --global user.name "Your Name"

6. config git email

git config --global user.email "youremail@example.com"

7. Authenticate Fingerprint
ssh -T git@github.com

8. Clone Existing Repository
git clone <repository_url> <directory_name>

Example: git clone git@github.com:example-project ~/Documents/my-local-project

8. Push A Change

Create example file and push change with

git add "ExampleFileName"

git commit

git push origin main
