class User < ActiveRecord::Base
  # tell bcrypt how hard to work to obscure password
  BCrypt::Engine.cost = 12

  # email and password_digest fields must exist
  validates :email, presence: true
  validates :password_digest, presence: true

  # a user must have a password & password confirmation field
  # the fields are match against each other but never persisted to the database
  validates_confirmation_of :password

  # TODO: add validator for unique emails
  
  # has_secure_password
  # has_secure_password does these things:
    # requires password_digest field
    # sets up password confirmation
    # creates getter for password
    # creates setter for password (uses bcrypt to hash it into password_digest)
    # creates authenticate method to check password (returns user if correct, false if incorrect)

  # get password, equivalent to `attr_reader :password`
  # for testing only 
  def password
    @password
  end

  # setter for password
  # allows us to give password instead of password_digest when creating a user
  def password=(unencrypted_password)
    # make an instance variable to store unencrypted password
    @password = unencrypted_password
    # set the password_digest field on this user to an obscured version
    self.password_digest = BCrypt::Password.create(@password)
  end


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


  # class method `::confirm`
  # looks up a user by email in the database, and checks password
  def self.confirm(email_param, password_param)
 	# look up user by the email that was passed into this method
    user = User.find_by_email(email_param)
    # check that user's password matches the stored password_digest
    user.authenticate(password_param)
  end

end