# Auth in Rails

## Authentication Review

**Authentication** is the process of verifying a user's credentials to prove they are who they say they are. This is different than **authorization**, enabling or disabling access to specific resources.

To authenticate our users we typically ask them for a **password** we can associate to their `email`. A password is a very private piece of information that must be kept secret, and so, we strategically obscure in such a way that *one can only confirm a user is authentic and never uncover what their actual password*.

Our library of choice for password obfuscation is `BCrypt`. We'll add it to our gemfile and use it to salt and hash passwords. In Rails, the convention is to push more logic into our models, so it shouldn't come as a surprise that authentication setup will happen in the **user model.**

## Creating a Secure Password

To "roll our own" authentication system with BCrypt, we'll add instance methods and class methods to our `User` model. The methods below handle creating a user with a secure password and authenticating a user:

```ruby
#
# app/models/user.rb
#
class User < ActiveRecord::Base
  BCrypt::Engine.cost = 12

  validates :email, :password_digest, presence: true
  validates_confirmation_of :password

  def authenticate(unencrypted_password)
    secure_password = BCrypt::Password.new(self.password_digest)
    if secure_password == unencrypted_password
      self
    else
      false
    end
  end

  def password=(unencrypted_password)
    @password = unencrypted_password
    self.password_digest = BCrypt::Password.create(@password)
  end

  def password
    @password
  end

  def self.confirm(email_param, password_param)
    user = User.find_by_email(email_param)
    user.authenticate(password_param)
  end

end
```

Rather than rolling our own auth, we can take a more concise, "rails-y" approach with <a href="" target="_blank">`has_secure_password`</a>, which adds authentication methods for us.

## Sessions

> From [Rails Guides - Sessions](http://guides.rubyonrails.org/security.html#what-are-sessions-questionmark)

> HTTP is a stateless protocol. Sessions make it stateful.

Most applications need to keep track of  some information about a particular user (called the "state" of the user). This could be the contents of a shopping basket or the user id of the currently logged in user. Without sessions, the user would have to identify, and probably authenticate, every time they made a new HTTP request. Rails will create a new session automatically when a new user accesses the application. It will load an existing session if the user has already used the application.

A session usually consists of a hash of values and a session id. The session id is usually a 32-character string, and it identifies the hash. The session id is passed between the server and client often to keep track of the information in the hash. Every cookie the server sends to the client's browser includes the session id. And in the other direction: the browser sends the session id to the server every time it makes a request for the client. In Rails, you can save and retrieve values using `session` hash:

```ruby
session[:user_id] = @current_user.id
User.find(session[:user_id])
```

## RESTful routes for Auth

Even when we are doing authentication, we still want to use RESTful routes. So, we'll call `users#create` for signup (creating a user), and for logging in we'll call `sessions#create`. We are going to manage logging in from a `SessionController` with `new` (login page), `create` (create a session), and `delete` (logout) actions.

```ruby

# config/routes.rb

  resources :users, only: [:new, :create, :destroy]
  resources :sessions, only: [:new, :create, :destroy]
```

```ruby
#  app/controllers/sessions_controller.rb

class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.confirm(params[:email], params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
      redirect_to new_session_path
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end

end

```

## Current User

If you want an `@current_user` method to be available in all your controllers and views, then you'll want to define an application level helper method that looks up the user from the `session[:user_id]` if it exists.

```ruby
#  app/controllers/sessions_controller.rb

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def current_user
    @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
  end

  helper_method :current_user #makes @current_user available in views
end

```
You can use this `@current_user` object to do a lot

* Authorization - `@current_user.present?` means the user is logged in.
* User Profile - `user_path(@current_user)` will be the path to the current user's profile
