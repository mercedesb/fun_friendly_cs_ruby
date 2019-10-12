# Fun, Friendly Computer Science -- Ruby

Code samples to support my "Fun, Friendly Computer Science" talk.

## Talk Abstract
Computer science concepts like Big O Notation, set theory, data structures, and principles of object-oriented programming sound intimidating, but they don’t have to be! This talk will dive into some fundamental computer science topics and debunk the myth that only ‘real’ programmers know CS.

Whether you are a bootcamp grad, self-taught career switcher, or someone who, like me, didn't pay attention in night class, join me as we explore some computer science theory behind the code we write every day through fun illustrations and real-world examples.

## Ruby on Rails

All of the code samples are written in [Ruby on Rails](https://rubyonrails.org/). This is a vanilla RoR setup.

### Ruby version
Please refer to `.ruby-version` to find the Ruby version for this project. You may want to use a Ruby version management tool to install and set your local Ruby version. I prefer [`rbenv`](https://github.com/rbenv/rbenv).

## Dependencies

I tried to reduce dependencies as much as possible. This project uses [Bundler](https://bundler.io/) to manage the Ruby gems. If you don't already have Bundler, you can install it as you would any other gem.

```
gem install bundler
```

This project uses [Yarn](https://yarnpkg.com) as the package manager. If you don't already have Yarn and are on Mac or Linux, you can use [Homebrew](https://brew.sh/) to install it

```
brew install yarn
```

## Project set up
```
git clone https://github.com/mercedesb/fun_friendly_cs_ruby.git
cd fun_friendly_cs_ruby
bundle install
yarn install
rails server
```

## Running the tests
This project uses [Rspec](https://rspec.info/) as the unit testing framework.

```
bundle exec rspec
```
