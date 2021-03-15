class SigninController < ApplicationController
  def index
      c=Signin.check
      if c!=nil
        redirect
      else

      end
end
