class MenuItemsController < ApplicationController
  skip_before_filter :set_current_user
  def create
    name_ = params[:menu_item][:name]
    price_ = params[:menu_item][:price]
    description_ =params[:menu_item][:description]
    m_c_id_ = 7
    menu_item = MenuItem.find_by_name(name_)
    if menu_item.nil?
       new_menu_item=MenuItem.create!(name: name_, price: price_, description: description_ , menu_category_id: m_c_id_)
       render json: new_menu_item
    else
      render text: '409 conflict', status: 409
    end
  end
  def destroy
    id_=params[:id]
    record=MenuItem.find(id_)
    record.delete
    render json: record
  end
  def update
    id=params[:id]
    record = MenuItem.find(id)
    record.name = params[:name]
    record.price=params[:price]
    record.description=params[:description]
    record.save!
    render text: "The menu item was successfully updated!!"
  end
  def index
    records = MenuItem.all
    render json: records
  end
  def show
    id_ = params[:id]
    record = MenuItem.find(id_)
    render json: record
  end
end
