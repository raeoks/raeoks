SHELL := /usr/bin/env bash -e

BUNDLER_VERSION = 1.13.6

.SILENT: all
all: clean init

clean:
	rm -rf app/sources/styles app/sources/scripts bin var tmp log

init:
	mkdir -p bin/vendor var/public tmp/vendor log
	rbenv install
	rbenv rehash
	gem install bundler --version ${BUNDLER_VERSION}
	nodenv install
	nodenv rehash

install:
	bundler install --path tmp/vendor --binstubs bin/vendor
	npm install
	npm run yarn install

setup: init install

.PHONY: rake-%
rake-%:
	bundle exec rake $*

watch-scripts:
	./node_modules/.bin/webpack --progress --colors --watch

watch-styles:
	./bin/vendor/sass --watch ./app/assets/styles/raeoks.sass:./app/sources/styles/raeoks.css

preview:
	bundle exec rake preview

run:
	make --jobs watch-scripts watch-styles preview
