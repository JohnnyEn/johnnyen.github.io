#!/usr/bin/env sh

# abort on errors
set -e

# installs a project
npm install

# build
npm run docs:build

# navigate into the build output directory
cd docs/.vuepress/dist

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git add -A
git commit -m 'deploy'

git push -f git@github.com:JohnnyEn/cbrpnk.dev.git master:gh-pages

cd -
