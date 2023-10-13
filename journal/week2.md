# Terraform Beginner Bootcamp 2023 - Week 1

## Table of Contents

- [Week 2 Live stream](#week-2-live-stream)
  - [Week 1 Live agenda](#week-2-live-stream-agenda)
- [2 0 0 Setting up Terratowns Mock Web Server](#2-0-0-setting-up-terratowns-mock-web-server)
  - [Working with Ruby](#working-with-ruby)
    - [Bundler](#bundler)
    - [Install Gems](#install-gems)

<br>

## Week 2 Live stream

### Week 2 Live stream Agenda

<br>

## 2 0 0 Setting up Terratowns Mock Web Server

### Working with Ruby

#### Bundler 

Bundler is a package manager for ruby. It is the primary way to install ruby packages (known as gems) for ruby.

#### Install Gems

You need to create a Gemfile and define your gems in that file. 

```rb
source "https://rubygems.org"

gem 'sinatra'
gem 'rake'
gem 'pry'
gem 'puma'
gem 'activerecord'
```
Then you need to run the `bundle install` command.
This will install the gems on the system globally (unlike nodejs which installs packages in place in a folder called `node_modules`).  

A Gemfile.lock will be created to lock down the gem versions used in this project. 

#### Executing ruby scripts in the context of bundler

We have to use `bundle exec` to tell future ruby scripts to use the gems we installed. This is the way we set context. 

#### Sinatra

Sinatra is a micro web-framework for ruby to build web-apps.

It's great for mock or development servers or for very simple projects. 

You can create a web-server in a single file. 

#### Running the web server

We can run the web server by executing the following commands:

```rb
bundle install 
bundle exec ruby server.rb
```

All of the code for our server is stored in the `server.rb` file.

## 2 3 0 Resource Skeleton

### CRUD

Terraform Provider resources utilise CRUD. 
CRUD stands for Create, Read, Update, and Delete.

https://en.wikipedia.org/wiki/Create,_read,_update_and_delete


<br>

## Resources 
- [Ruby gems](https://rubygems.org)
- [Sinatra server](https://sinatrarb.com/)
- [Ruby on Rails - Active Model](https://guides.rubyonrails.org/active_model_basics.html)
- [](#)
- [](#)
- [](#)
- [](#)
- [](#)
