# README

The purpose of this app is to learn about: 
1. Authentication using the 'Devise' gem 
2. Authorization

These instructions assume that rails has been installed and that the enviroment has been set up.

## Getting started

Create the new app in terminal:
``` 
$ rails new members-only
```

Move into the `members-only` directory
```
$ cd members-only
```

### Add and install devise to your project

Add the following line to your Gemfile
```
gem 'devise'
```
Then run `bundle install`
Next, you need to run the generator:
```
$ rails generate devise:install 
```
Add the following line to `config/environments/development.rb`
```
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }

```


