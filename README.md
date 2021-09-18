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
Then run `bundle install`. Next, you need to run the generator:
```
$ rails generate devise:install 
```
Add the following line to `config/environments/development.rb`
```rb
config.action_mailer.default_url_options = { host: 'localhost', port: 3000 }
```

### Add Home views and controllers
Generate the some views and controllers for your app

```
$ rails g controller home index 
```

To see the `index.html.erb` view on your browser type in the terminal 
````$ rails s````
 and open http://localhost:3000/home/index on your browser. (At any point you can exit the server by typing `CMD+C`.

In order to access the homepage directly from http://localhost:3000 copy the fllowing line to `routes.rb`:
```rb
root 'home#index' 
```

 Copy and paste the template from [getbootsrap.com](https://getbootstrap.com/docs/4.0/getting-started/introduction/#starter-template) to your `app/views/layouts/application file` and customize it. You can simply replace the content of the `application.html.erb` file with the following snippet:
 ```erb
 <!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Members Only App</title>
    <%= csrf_meta_tags %>
    <%= csp_meta_tag %>

    <%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>
    <%= javascript_pack_tag 'application', 'data-turbolinks-track': 'reload' %>
  </head>
  <body>
    <div class="container">
    <br/>
      <%= yield%>
    </div>

    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  </body>
</html>
```
Lastly, add a new 'about' page by creating a new file called `about.html.erb` on the home directory at `/members-only/app/views/home/`

Copy and paste the following line into the `about.html.erb` file:
````erb
<h1>About Us</h1>

````

#### Add a Navbar
On the folder `/app/views/layouts/` create a new file called `_header.html` and paste the following snippet into that file:
```erb
<nav class="navbar navbar-dark bg-dark navbar-expand-lg" >
  <%= link_to "Memebers Only", home_index_path, class:"navbar-brand" %>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <%= link_to "About Us", home_about_path, class:"nav-link" %>
      </li>
    </ul>
  </div>
</nav>

```