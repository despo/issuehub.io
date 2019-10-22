# issuehub.io

[![Build Status](https://travis-ci.org/despo/issuehub.io.svg?branch=master)](https://travis-ci.org/despo/issuehub.io)

[**issuehub.io**](http://issuehub.io) is a small project that enables you to find GitHub issues to work on. Unlike other contributing projects, the focus is on labelled issues rather than projects.

The reason for making this project is to encourage issue labelling on open source projects, so that people with different types of experience and knowledge levels can easily find something to help out with.

## Getting started

### Install ruby

 ```bash
 rvm install 2.5.1
 ```

| Install          | Link  |
| ------------- | :-----|
|    rvm install 2.5.1 |https://rvm.io/rvm/install |


### Install the gems using the **Gemfile**

```bash
gem install bundler
bundle install
```
| bundler          | Info Link  |
| ------------- | :-----|
|   Gemfile |https://bundler.io/gemfile.html |

### Set up the .env file
```bash
cp .env.example .env
```

### Make sure the tests are passing

```bash
bundle exec rake spec
```

### Run the app!

```bash
bundle exec rackup
```

## Contributing

Find something to work on. You can pick one of the open issues, if there are any, fix the bugs to the best of your ability, improve the interface, refactor the code! Otherwise, you can always improve test coverage.

If there is something else that you would like to work on or other ways to improve **issuehub**, open an issue first so we can discuss it.

Also, have a look at the [contribution guidelines](https://github.com/despo/issuehub.io/blob/master/CONTRIBUTING.md).

## Copyright

Copyright (c) 2013-2018 Despo Pentara. See [LICENSE](https://github.com/despo/kobol/blob/master/LICENSE) for details.
