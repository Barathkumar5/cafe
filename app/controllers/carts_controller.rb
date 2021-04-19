class CartsController < ApplicationController
  def create
    id=current_user.id
    new_cart=Cart.create!(user_id: id, status: null, total_price: 0 )
    render json: new_cart
  end
  def update
    id=params[:id]
    order=Cart.find(id)
    order.status="pending delivery"
    order.save!
    render json: order
  end
  def destroy
    id=params[:id]
    cart=Cart.find(id)
    cart.delete
    render text: "cart with id:#{id} is deleted"
  end
  def index
    token=request.headers['authorization']
    if token=='null'
      render text: 'unauthorized', status: 401
    else
    user=User.find_by_email(token)
    item=Cart.find_by_user_id(user.id)
    render json: item
    end
  end
  def show
    id=params[:id]
    token=request.headers['authorization']
    if token=='null'
    render text: 'unauthorized', status: 401
    else
      current_user=User.find_by_email(token)
      user_id=current_user.id
      cart=Cart.find_by_user_id(user_id)
      render json: cart
    end
  end
end
