class CartsController < ApplicationController
  def create
    id=current_user.id
    new_cart=Cart.create!(user_id: id, status: null, total_price: 0 )
    render json: current_user
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
    user_id=params[:user_id]
    items=Cart.where('user_id' => user_id)
    render json: items
  end
  def show
    id=params[:id]
    cart=Cart.find(id)
    render json: cart
  end
end
