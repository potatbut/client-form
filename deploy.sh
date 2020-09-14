#!/usr/bin/env sh


set -e

# сборка
npm run build

cd dist



git init
git add -A
git commit -m 'deploy'



git push -f git@github.com:potatbut/client-form.git master:gh-pages



cd -