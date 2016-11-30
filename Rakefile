# Usage: rake deploy
desc "Begin a push static file to GitHub"
task :deploy do
  puts "! Copy static file from _site to _deploy"
  sh "rm -rf _site/*"
  sh "jekyll build"
  sh "rm -rf ~/tmp/gh-pages"
  sh "git clone -b master git@github.com:mhangyo-wni/mhangyo-wni.github.io.git ~/tmp/gh-pages"
  sh "cp -R _site/* ~/tmp/gh-pages"
  sh "cd ~/tmp/gh-pages"
  sh "git branch"
  sh "git add -A"
  sh "git status -s > /tmp/gitstatus"
  sh "cat /tmp/gitstatus"
  sh "if [ -s /tmp/gitstatus ]; then \
         git commit -m 'Commit at CircleCI' ;\
         git push origin master ;\
      else \
         echo 'no change source' ;\
      fi"
end
