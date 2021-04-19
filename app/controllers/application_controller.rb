class ApplicationController < ActionController::Base
  #protect_from_forgery
  before_filter :set_current_user
  private
  def set_current_user
    #byebug
    if request.headers['authorization']=='null'
      render text: '401', status: 401
    else
      @current_user = User.find_by_email(request.headers['authorization'])
    end
  end
end
