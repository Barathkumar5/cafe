class CartItemsController < ApplicationController
  def create
    user_cart=Cart.find_by_user_id(current_user.id)
    cartid= user_cart.id
    menuitem_id = params[:cart_item][:menu_item_id]
    cart_item=CartItem.new(
    menu_item_id: menuitem_id,
    quantity: 1,
    cart_id: cartid)
    cart_item.save
    menu_item=MenuItem.find(menuitem_id)
    total_price=user_cart.total_price
    price=menu_item.price
    user_cart.total_price =total_price + price
    user_cart.save!
    render json: cart_item
  end
  def destroy
      id=params[:id]
      cartitem=CartItem.find(id)
      cartid=cartitem.cart_id
      current_cart=Cart.find(cartid)
      price=current_cart.total_price
      menuitem=MenuItem.find(cartitem.menu_item_id)
      current_cart.total_price=price-menuitem.price
      current_cart.save!
      cartitem.delete
      render json: current_cart
  end
  def index
    items=CartItem.includes(:menu_item).where('status' => 'pending delivery')
    render json: items
  end

end
