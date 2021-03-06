# require 'bcrypt-ruby'

class User < ActiveRecord::Base
  include BCrypt
  validates_presence_of :name, :email

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end

end
