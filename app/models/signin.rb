class Signin < ActiveRecord::Base
  def check
    email=params[:email]
    password=params[:password]
    Customer.exists? email: email , password: password
  end
end
