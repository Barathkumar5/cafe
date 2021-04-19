class SessionsController < ApplicationController
  skip_before_filter :set_current_user
  def create
    email=params[:email]
    user=User.find_by_email(email)
    if user.nil?
      render text: 'invalid_grant', status: 400
    else
      render json: {access_token: user.email}
    end
  end
  def destroy
     @current_user=nil
  end
end
