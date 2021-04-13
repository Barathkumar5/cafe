class SessionsController < ApplicationController
  def create
    email=params[:signin][:email]
    user=User.find_by_email(email)
    if user.nil?
      render json: user
    else
      session[:user_id]=user.id
      render json: user
    end
  end
  def destroy
     session[:user_id]=nil
     flash.now.alert = "Logged Out"
  end
end
