#Auth in Rails

| Objectives |
| :--- |
| Securely store users' passwords in Rails |
| List steps required to implement a user story |
| Enable signup, login, and logout |
| Build routes, controllers, and views for each user story |



## App Setup

Let's start a new Rails application:

* `rails new RailsAuth -T -B -d postgresql`
* `cd RailsAuth`
* `rake db:create`
* `subl .`

## Authentication Review

**Authentication** is the process of verifying a user's credentials to prove they are who they say they are. This is different than **authorization**, enabling or disabling access to specific resources.

To authenticate our users we typically ask them for a **password** we can associate to their `email`. A password is a very private piece of information that must be kept secret, and so, we strategically obscure in such a way that *one can only confirm a user is authentic and never uncover what their actual password*.

Our library of choice for password obfuscation is called `BCrypt`. This will be added to our gemfile for authentication setup later. In Rails, the convention is to push more logic into our models, so it shouldn't come as a surprise that authentication setup will happen in the **user model.**

Remember, **never store passwords**, only the digested versions. 

Let's uncomment `bcrypt` at the bottom of our `Gemfile`. We use it to obscure the plain-text password and store it in a `password_digest` field.

`Gemfile`

```ruby
	# Use ActiveModel has_secure_password
	gem 'bcrypt', '~> 3.1.7'
```


Then run `bundle` to finish installation of `bcrypt` and the other gems.

### Playing With `BCrypt`

As soon as something is installed via bundler we can access it via our `rails console.` Let's play in console.


```bash
	Loading development environment (Rails 4.1.6)
 ## BCrypt::Password.create hashes its input
	2.1.0 :001 > hashed_pass = BCrypt::Password.create("swordfish")
	 => "$2a$10$6MQQCxBpfu16koDVs3zkbeSXn1z4fqKx9xLp4.UOBQBDkgFaukWM2"

 ## BCrypt::Password.new lets us compare hashed input to another unhashed value
 	2.1.0 :003 > BCrypt::Password.new(hashed_pass) == "tunafish"
 	=> false
 	
 ## Let's compare our password to original
 	2.1.0 :004 > BCrypt::Password.new(hashed_pass) == "swordfish"
 	=> true
 	
 ## Exit
 	2.1.0 :005 > exit
```


Hopefully this helps you begin to think about how to set up an **authenticate** method for the `User`.


## Test Setup

* Add testing the three testing gems below to both test and development environments, then run `bundle`

```ruby
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Use rspec tests for rails
  gem 'rspec-rails'
  gem 'rails_helper'
  
  gem 'minitest'
end
```

* `bundle` and then run the command `rails g rspec:install` to initialize rspec as your testing suite.
	* Now a `spec` directory has been created for you

## Test Setup

We'll look at how to write rspec tests for Rails soon, but for now we'll set up some prewritten tests for the User model methods we'll have in our project. These depend on a `User` model existing.  

1. Generate a User model.

  Remember: The default attribute type is string, if we don't specify.

  ```bash
  rails g model user email password_digest
  ```

  We're using `email` as the username for our user, and the `password_digest` is a fancy term for a hashed password. 

  Note: If you ever make a mistake during a `rails generate` command, you can reverse it with `rails destroy <resourceType> <resourceName>`. In this case it would be `rails d model user`.*

1. Run the generated migrations.

  ```bash
  rake db:migrate
  ```

1. Inside the `spec` directory, overwrite the file `/models/user_spec.rb` with the tests in [user_model_tests.md](user_model_tests.md). That file is just another markdown file we added to the directory with this README, so don't try to clone or get it directly. Just copy the tests from it into your `/model/user_spec.rb`.

  Run them with:

  ```bash
  rspec
  ```

  If you see an error that `minitest` could not be found, install that gem from your Terminal and try again.

## Authentication (TDD Style)

In the process of passing these tests, we will build all the logic for an authentication system! You should never write this code from scratch for an actual app, but it is very important you understand what is going on.

1. Run `rspec`. Note the first few tests.

1. Add the following code snippets into your User model one at a time, and run `rspec` after each snippet to see the tests pass.

  
  * Starting point:
      ```ruby
      # app/models/user.rb

      class User < ActiveRecord::Base
      # ... insert snippets here
      end
      ```

  * 
    ```ruby
    # tell bcrypt how hard to work to obscure password
    BCrypt::Engine.cost = 12
    ```


  * 
    ```ruby
    # email and password_digest fields must exist
    validates :email, presence: true
    validates :password_digest, presence: true

    # TODO: add validator for unique emails
    ```

  * 
    ```ruby
    # a user must have a password & password confirmation field
    # the fields are match against each other but never persisted to the database
    validates_confirmation_of :password
    ```


    
  * 
    ```ruby
    # get password (equivalent to `attr_reader :password`)
    # for testing only 
    def password
      @password
    end
    ```

  *
    ```ruby
    # setter for password
    def password=(unencrypted_password)
      # make an instance variable to store unencrypted password
      @password = unencrypted_password
      # set the password_digest field on this user to an obscured version
      self.password_digest = BCrypt::Password.create(@password)
    end
    ```

  * 
    ```ruby
    # authenticate the user (check password) using bcrypt
    def authenticate(unencrypted_password)
      # create a new `secure_password` object with special `==`
      secure_password = BCrypt::Password.new(self.password_digest)
      # check that a hashed version of the unencrypted password is the same as the secure password
      # the method `==` has been modified for `secure_password` to first hash whatever it's comparing to
      if secure_password == unencrypted_password
        # password correct - return the user
        self
      else
        # password incorrect - return false
        false
      end
    end
    ```

  * 
    ```ruby
    # class method `::confirm`
    # looks up a user by email in the database, and checks password
    def self.confirm(email_param, password_param)
      # TODO - recall we will add a unique email validator later

      user = User.find_by_email(email_param)
      user.authenticate(password_param)
    end
    ```


## Signup

###User Stories and Development Stories

* A user should be able to... go to `/sign_up` and see a new user form.
    * add `GET /sign_up` route to execute the `users#new` action 
    * render `/views/users/new.html.erb`
    * add a `form_for` the new user with email, password, and password_confirmation fields

* A user should be able to... enter their information in the new user form and submit to create a new user.
  * ensure the form has a `submit` field
  * POST the form to `users#create`
  * set up the User model's fields and validations
  * have `users#create` create a new user in the database
  * have `users#create` redirect to `root_path` for now

* A user should be... logged in and redirected to their profile automatically when their account is created.
  * have `users#create` log the user in
  * have `users#create` redirect to their user show page (`user_path(user)`)

* A user should be able to... go to `/users/:id/` and see their information.
  * add a `GET /users/:id` route
  * set up a `users#show` controller action
  * render `/views/users/show.html.erb`
  * display user information on the show view



Let's get started!

## Routes

Let's edit our `config/routes.rb` file...


```ruby
# config/routes.rb

Rails.application.routes.draw do

  root to: "welcome#index"

  get "/login", to: "sessions#new", as: "login"

  post "/sessions", to: "sessions#create"

  get "/sign_up", to: "users#new", as: "sign_up"

  resources :users, only: [:new, :create, :show]

end
```

Remember, `resources` will automatically generate RESTful routes for a resource.

Run `rake routes` in the Terminal to see all the application's routes.

## Home Page

1. Start your application and debug using the error messages until the view rendered on the `root_path` displays a welcome message.**

  Hint: You will have to add a `Welcome` controller -- one of the conventional controller names for non-resource pages.

1. On the home page, add a `link_to` sign up at the `/sign_up` route.


## Users Controller

1. Create a skeletal `UsersController`: `rails g controller users`.

1. Add actions for `new`, `create`, and `show`.

1. Add a private method that creates strong parameters for specific attributes of the user.

You should end up with...

  ```ruby
  # app/controllers/users_controller.rb

  class UsersController < ApplicationController
    
    def new
    end

    def create
      # TODO: once the controller is implemented don't forget to also log the user in
    end

    def show
    end

    private
    
    def user_params
      params.require(:user).permit(:email, :password, :password_confirmation)
    end

  end
  ```

##Exercise: Implement Signup

### A user should be able to... go to `/sign_up` and see a new user form.

1. Add `GET /sign_up` route to execute the `users#new` action (done!).
1. Render `/views/users/new.html.erb`.  Hint: You'll have to create this file.
1. Add a `form_for` the new user to that view with `email`, `password` and `password_confirmation` fields.

### A user should be able to... enter their information in the new user form and submit to create a new user.

1. Add a submit field to the new user form.
1. POST the form to `users#create`.  Hint: modify the `users#new` to send a dummy new user instance variable to the new user form. 
1. Set up the User model's fields and validations (done!).
1. Have `users#create` create a new user in the database.  
  * Bonus: create a condition that checks if the user was saved correctly. Hint: first build the user in memory with `.new`, then try to save the user. Check `if @user.save` -- if so, proceed as normal; `else` render the signup page again.
1. Have `users#create` redirect to `root_path` for now.

### A user should be... logged in and redirected to their profile automatically when their account is created.

1. **SKIP** Have `users#create` log the user in. Skip this for now; we'll set up sessions after we create the user show view.
1. Add a comment to the `users#create` action that says `# TODO log user in` so you can find this easily later.
1. Have `users#create` redirect to the new user's show page (`user_path(user)`).
1. For your ` GET /sign_up` route, which hits the action `users#new`, render a file `new.html.erb` in `/views/users`.
1. Set up an instance variable so 

### A user should be able to... go to `/users/:id/` and see their information.

1. Add a `GET /users/:id` route (done!).
1. Set up a `users#show` controller action (done!).
1. Render `/views/users/show.html.erb`. Hint: create this file.
1. Display user information on this profile view. Hint: update the `users#show` action to find the proper user in the database based on the url parameters, and use an instance variable to pass user data from the controller to the view.


### Refactor: `users#show` will always find the [current user](#current_user) and display their profile page. 

1. Read on!

##Session Management

<h3 id="session_creation">Login</h3>

Creating a session is essentially what we mean by logging in, and logging out is destroying a session. We will have a single controller dedicated to session management, `SessionsController`. This controller should only have `new`, `create`, and `destroy` actions.

1. Generate a sessions controller and add the following code to it:


  ```ruby
  # app/controllers/sessions_controller.rb 

  class SessionsController < ApplicationController
    # show the login form
    def new
      # TODO: render a login form view
    end

    # create the session, logging in the user
    def create
      if User.confirm(params[:email], params[:password])
        # save the user's id into the session
        session[:user_id] = user.id
        #redirect to the show page
        redirect_to user_path(user.id)
      else
        #there was an error logging the user in
        redirect_to login_path
      end
    end
    
    # logout the current user
    def destroy
      # TODO: remove the user's id from the session
    end
    
  end

  ```

1. Run `rake notes` to see the comments marked `TODO`.

After we confirm someone is a user and authenticate them, we set `session[:user_id] = user.id`. This allows the `user.id` to be stored in a cookie for lookup later. Of course, then we have to use `session[:user_id]` to look up the current user in our database every time we want their information. 


Now that we know how to login a user with `session[:user_id] = user.id`, let's also make sure to do that when a user is signed up (it is good UX for a signup to automatically perform a login).

1. Go back and do the development story we **SKIPPED**: Have `users#create` log the user in. 

1. Run `rake notes` to see all the remaining items marked as `TODO` in the comments.




###Current user

When logging in a user, we set `session[:user_id] = user.id`. What if we could take advantage of this fact for quicker lookup? Instead of reading the user_id from the session and then finding the correct user in the database -- every time we need the user — what if we only did it once, and cached the result? In other words, what if we cached the `current_user`?

1. Add the following code to your application controller.

  ```ruby
  # app/controllers/appplication_controller.rb

  class ApplicationController < ActionController::Base
    def current_user
      # set instance variable to either nil (if session[:user_id] is nil)
      # or to the user with that id
      @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
    end
    # make current_user method available in views
    helper_method :current_user 
  end
  ```

This application-wide controller method defines `@current_user` if it is not already defined. The way the `&&` operator works is that it will keep evaluating if `session[:user_id]` is defined and then set `@current_user` to whatever the last item evaluated is; in this case it would be `User.find_by_id(session[:user_id])`, so the user itself.

`current_user` is very useful for:

* Conditional views based on the `current_user`'s state
	* I.e. is a login or logout button displayed in the navbar?
* Authorization to view resources
	* I.e. test if `current_user` is the user whose resources are being CRUDed.

###Logout

1. In the `session#destroy` controller action, set the `session[:user_id]` to `nil` and redirect to your `root_path`.

## Refactor -- the Rails Way

* Using [`has_secure_password`](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html#method-i-has_secure_password) can magically refactor a lot of our password storing logic in the User model. 

1. Try `has_secure_password` out and see if the tests still pass...

```ruby
class User < ActiveRecord::Base
  # email must exist
  validates :email, presence: true
  # TODO: add validator for unique emails

  has_secure_password
  # has_secure_password does these things:
    # requires password_digest field
    # sets up password confirmation
    # creates getter for password
    # creates setter for password (uses bcrypt to hash it into password_digest)
    # creates authenticate method to check password (returns user if correct, false if incorrect)

  # class method `::confirm`
  # looks up a user by email in the database, and checks password
  def self.confirm(email_param, password_param)
  # look up user by the email that was passed into this method
    user = User.find_by_email(email_param)
    # check that user's password matches the stored password_digest
    user.authenticate(password_param)
  end
```

![success!](http://i.giphy.com/b6oC7bEdJD26c.gif)

## More Topics

###Authorization

You can secure your routes with a `:before_action` [filter](http://guides.rubyonrails.org/action_controller_overview.html#filters). This code can be run before any `controller#action` in the application. For example let's say a user must be logged before they can see all the `posts` in the application. You could create a private method in the application controller with a name such as `require_login`.



```ruby
# app/controllers/application_controller.rb

class ApplicationController < ActionController::Base
 
 # ...
 
  private
 
  def require_login
    if !current_user
      redirect_to root_path #halts the request cycle
    end
  end
end
```

Now you could use a `before_action` to run the `require_login` method before any actions the `PostsController` will perform. (But don't worry about setting up a whole posts controller in class just to test this!)

posts_controller.rb

```ruby

class PostsController < ApplicationController
  before_action :require_login
  def index
  end
end
```

Like `resources` for routes, the action filters have `only` & `except` options to control exactly which actions they affect.

###Adding Flash Messages

If someone fails to log in, we want to notify them.  Rails has "flash storage" for this purpose. That's a type of session storage that is stored for the next request only and then cleared.



```ruby

#session_controller.rb

class SessionsController < ApplicationController

  # ...

  def create
    user_params = params.require(:user)
    user = User.confirm(user_params[:email], user_params[:password])
    if user
      session[:user_id] = user.id
      redirect_to user_path(user.id)
    else
       # Flash an error message
      flash[:error] = "Failed To Authenticate. Please try again."
      redirect_to login_path
    end
  end

  # ...

end
```

#### Styling Flash Messages

Install the [twitter-bootstrap-rails](https://github.com/seyhunak/twitter-bootstrap-rails) gem and require it by running `rails generate bootstrap:install static`

We can then render these message and style them with a class that matches their name on all pages.


```html+erb
<!-- application.html.erb -->
<!-- include this just above the yield -->
<%= bootstrap_flash %>

<%= yield %>

```

Now you need to pass in flash messages to your views! For example my user controller could look like this.



```ruby
# app/controllers/users_controller.rb
class UsersController < ApplicationController
  before_action :require_login, only: :index

  # to illustrate a before_action
  def index
    @users = User.all
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      #login user
      session[:user_id] = @user.id
      #redirect to user#show w/ success message
      redirect_to @user, flash: { success: "Successfully signed up!" }
    else
      #there was an error, go back to signup page & display message
      redirect_to sign_up_path, flash: { error: @user.errors.full_messages.to_sentence }
    end
  end

  def show
    @user = current_user
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
```

##Solution

A sample solution is provided [here](https://github.com/sf-wdi-22-23/rails-auth/solution).


A similar app tutorial is available <a href="https://gist.github.com/thebucknerlife/10090014" target="_blank">here</a>.
