class MenuCategoriesController < ApplicationController

def create
  category_= params[:category]
  @category= MenuCategory.create!(category: category_)
  render json: @category.as_json(only: [:category,:id])
end
def destroy
  id_= params[:id]
  record=MenuCategory.find(id_)
  record.delete
  render text: "The category with Id.No.#{id_} was deleted"
end
def update
  id=params[:id]
  record=MenuCategory.find(id)
  record.category=params[:category]
  record.save!
  render text: "The category was successfully updated"
end
def index
  records = MenuCategory.all
  render json: records.as_json(only: [:category,:id])
end
def show
  id_ = params[:id]
  record = MenuCategory.find(id_)
  render json: record.as_json(only: [:category,:id])
end
end
