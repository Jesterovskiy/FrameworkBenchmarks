#!/bin/bash

THREAD_FACTOR=1

fw_depends mysql rvm jruby-9.1

. $(dirname $0)/config/java_tune.sh

rvm jruby-$JRUBY_VERSION do bundle install --jobs=4 --gemfile=$TROOT/Gemfile --path=vendor/bundle

DB_HOST=${DBHOST} rvm jruby-$JRUBY_VERSION do bundle exec puma -t $MAX_CONCURRENCY:$MAX_CONCURRENCY -b tcp://0.0.0.0:8080 -e production &
