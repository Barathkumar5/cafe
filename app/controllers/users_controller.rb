class UsersController < ApplicationController
  def create
    email= params[:user][:email]
    user=User.find_by_email(email)
    if user.nil? and email
      firstname=params[:user][:first_name]
      new_user=User.new(first_name: firstname,
         last_name: params[:user][:last_name],
          email: params[:user][:email],
          phone: params[:user][:phone],
          residential_address: params[:user][:residential_address]
           )
      new_user.save
      new_cart= Cart.new(user_id: new_user.id, status: "Nil", total_price: "Nil")
      new_cart.save
      render json: new_user
    else
       render text: '409 conflict', status: :conflict
   end
 end
  def destroy
    id_=params[:id]
    user=User.find(id_)
    user.delete
    render json: user
  end
  def show
    id=params[:id]
    user=User.find(id)
    render json: id
  end
  def index
    email=params[:email]
    user=User.find_by_email(email)
    if user.nil?
      render json: user={}
    else
    render json: user
    end
  end
end
