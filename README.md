# [NWRUG.ORG](http://nwrug.org)

[![Build Status](https://travis-ci.org/nwrug/nwrug.org.svg?branch=master)](https://travis-ci.org/nwrug/nwrug.org)

The website of the North West Ruby User Group, a Manchester-based user group for
folk interested in the Ruby programming language.

## Setup

After cloning the repository, run `bundle install` to install all the gem
dependencies.

### MySQL

```sh
# install MySQL on Mac OS X
brew install mysql

# or on Ubuntu
sudo apt-get install mysql-server mysql-client libmysqlclient-dev

# setup the database
bundle exec rake db:setup
```

Use `bundle exec rails server` to run rails locally.

## Running the tests

```
bundle exec rake
```

All contributions welcome!
