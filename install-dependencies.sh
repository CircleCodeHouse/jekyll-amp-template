#!/bin/bash

BUNDLER_VERSION=$(cat Gemfile.lock | tail -1 | tr -d " ")
gem install bundler -v $BUNDLER_VERSION
bundle install
yarn --ignore-engines
