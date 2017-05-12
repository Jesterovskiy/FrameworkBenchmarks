#!/bin/bash

THREAD_FACTOR=2

fw_depends mysql rvm jruby-9.1

. $(dirname $0)/config/java_tune.sh

rvm jruby-$JRUBY_VERSION do bundle install --jobs=4 --gemfile=$TROOT/Gemfile --path=vendor/bundle

DB_HOST=${DBHOST} rvm jruby-$JRUBY_VERSION do bundle exec torquebox run --io-threads $(( MAX_CONCURRENCY / 2 )) --worker-threads $MAX_CONCURRENCY -b 0.0.0.0 -p 8080 -e production &
