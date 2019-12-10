#!/bin/bash

git config --global user.email "kevin@vandelayeducation.com"
git config --global user.name "Kevin Colten"
if [ "${CIRCLE_BRANCH}" == "preview" ]; then export JEKYLL_ENV='preview.'; fi
if [ "${CIRCLE_BRANCH}" == "preview" ] || [ "${CIRCLE_BRANCH}" == "master" ]; then
  yarn images
  yarn configs
  yarn jekyll-build-amp
  yarn optimize
  yarn css
  ITER=0
  for file in ./_configs/*; do
    if [[ -f $file ]] && [[ $(($ITER % $CIRCLE_NODE_TOTAL)) == $CIRCLE_NODE_INDEX ]]; then
      export KEY=$(echo $file | sed "s/^.\/_configs\/\(.*\).yml$/\1/")
      yarn jekyll-build
      yarn favicon
      if [ "${CIRCLE_BRANCH}" == "master" ]; then yarn sitemap; fi
      yarn jekyll-build
      yarn jekyll-build-amp
      yarn optimize
      if [ "${CIRCLE_BRANCH}" == "preview" ]; then yarn encrypt; fi
      yarn deploy
    fi
    ((ITER++))
  done
fi
