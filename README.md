# README

The purpose of [this app](http://members-only-post-odin.herokuapp.com/) is to learn about: 
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

### Generate Post scaffold
To generate the Post scaffold use:
```
$ rails g scaffold Post text:text
```
After starting the server (with `$ rails s`) check your new Post scaffold by opening on your browser the link [localhost:3000/posts](http://localhost:3000/posts).

Delete the `scaffolds.scss` file at `/app/assets/stylesheets/` to get rid of the conflicting css style an reload your page on the browser to see the changes.

Replace the content of the `index` file with the following code:

```erb
<p id="notice"><%= notice %></p>

<h1>Posts</h1>
<br>
  <div class="list-group">
    <% @posts.each do |post| %>
      <%= link_to post, class:"list-group-item list-group-item-action" do %>
          <div class="d-flex w-100 justify-content-between">
            <h5 class="mb-1">    <%  %>   </h5>
            <small><%= time_ago_in_words(post.created_at) %></small>
          </div>
        <p class="mb-1"><%= post.text %></p>
        <small>Author</small>
        
      <% end %>
    <% end %>
  </div>
<br/>  
<%= link_to 'New Post', new_post_path, class:"btn btn-secondary"%>

```
Add a link to the Posts page to the Navbar by the following code to `_header.html.erb`:

```erb
  <li class="nav-item">
    <%= link_to "Posts", posts_path, class:"nav-link" %>
  </li>
```
### Install simpleform

Add it to your Gemfile:

gem 'simple_form'
Run the following command to install it:

bundle install
Run the generator:

rails generate simple_form:install

(for more information check [simple_form documentation](https://github.com/heartcombo/simple_form))

### Add guard and guard-livereload
Add Guard (and any other dependencies) to a Gemfile in your project’s root:
```
group :development do
  gem 'guard'
end
```
then install it by running Bundler:
```
$ bundle
```
Generate an empty Guardfile with:
```
$ bundle exec guard init
```
Run Guard through Bundler with:
```
$ bundle exec guard
```
(for more information check [guard documentation](https://guardgem.org).)

Install the live_guard:
```
$ gem install guard-livereload
```
Add it to your Gemfile (inside development group):
```
group :development do
  gem 'guard-livereload', '~> 2.5', require: false
end
```
Add guard definition to your Guardfile by running this command:
```
$ guard init livereload
```
### Generate Devise Views
```
rails generate devise:views
```
### Add new columns to user  model
Create a new file in /app/controllers called `registrations_controller.rb`.

Add the following code to that file:
```erb
class RegistrationsController < Devise:RegistrationsController
    
    private
    
    def sing_up_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation)
    end

    def account_update_params
        params.require(:user).permit(:name, :username, :email, :password, :password_confirmation, :current_password)
    end
end
```
Add a new migration:
```
$ rails g migration AddFieldsToUsers
```

Replace the content of that file with the following code (the name of that file should end in ...add_fields_to_users.rb):
```erb
class AddFieldsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :name, :string
    add_column :users, :username, :string
    add_index :users, :username, unique: true
  end
end
```
Run the migration:
```
$ rails db:migrate
```

Add the name and username fields to `new.html.erb`:
```
    <%= f.input :name,
                required: true,
                input_html: { autocomplete: "name" }%>
    <%= f.input :username,
                required: true,
                input_html: { autocomplete: "username" }%>     
```

Delete the `autofocus: true,` line from the email field.

#### Add user_id column to Post
Create a new migration to add the user_id to posts
```
$ rails g migration AddUserIdToPost user_id:integer
```
Run the migration (`$ rails db:migrate`)

Replace the content of the post controller with the following code:
```rb
class PostsController < ApplicationController
  before_action :set_post, only: %i[ show edit update destroy ]
  before_action :authenticate_user! , except: [:index]


  # GET /posts or /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1 or /posts/1.json
  def show
  end

  # GET /posts/new
  def new
    @post = current_user.posts.build
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts or /posts.json
  def create
    @post = current_user.posts.build(post_params)

    respond_to do |format|
      if @post.save
        format.html { redirect_to @post, notice: "Post was successfully created." }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1 or /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: "Post was successfully updated." }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1 or /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: "Post was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:text)
    end
end
```
## (Optional) Publish your web app

### Swtich from using sqlite to a PostgreSQL database

In your `Gemfile` **cut** the line that says *'gem sqlite3...'* and paste it within the development group (in the `Gemfile`:)
```rb
group :development do
  ...
  {paste [gem 'sqlite3', '~> 1.4'] here (without parethesis.)}
end
```
Then paste the current version of [posgtres](https://rubygems.org/gems/pg) -as of now `gem 'pg', '~> 1.2', '>= 1.2.3'` to the production group. Add the following code to your gemfile:
```rb
group :production do
  gem 'pg', '~> 1.2', '>= 1.2.3'  
end
```
Then in terminal use:
```
$ bundle install
```

### Launch your app to heroku
---
**Note**: You need to log in with [heroku](heroku.com) aset in for your enviroment. Luckily it is easy and free to use. Check out [this tutorial](https://devcenter.heroku.com/articles/getting-started-with-rails6) about how to set heroku with rails.

------

After [loging in](https://devcenter.heroku.com/articles/heroku-cli#getting-started) from your terminal, create a new heroku app. The name of the app must be unique in heroku.
```
$ heroku create [new-app-name]
```
You can check if if heroku is one of your remote repositories by checking:
```
git remote -v
```
After committing your project to github. Push your app to heroku.
```
git push heroku main
```
Migrate your database in heroku
```
heroku run rails db:migrate
```
