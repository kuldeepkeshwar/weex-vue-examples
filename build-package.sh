#!/bin/bash

# for mini-app package
function copy_page () {
  cp dist/$1.weex.js package/pages/$1.weex.js
}

# for multi-platform bundle
# function copy_page () {
#   mkdir package/pages/$1
#   cp dist/$1.weex.js package/pages/$1/index.weex.js
#   cp dist/$1.web.js package/pages/$1/index.web.js
# }

rm -rf package
mkdir package package/pages

npm run build

cp src/app.json package/app.config.json
cp dist/worker.weex.js package/app.js
cp dist/shared.weex.js package/shared.js

copy_page "about"
copy_page "examples"
copy_page "guide"
copy_page "landing"
copy_page "news"


# tar -zcvf app.zip package/*