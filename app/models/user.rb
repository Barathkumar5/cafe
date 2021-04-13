class User < ActiveRecord::Base
  has_many :carts
  attr_accessible :first_name, :last_name, :email, :phone, :residential_address

  #has_secure_password
  def self.authenticate(email)
    user = find_by_email(email)
    #render json: user
  end

  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end


end
