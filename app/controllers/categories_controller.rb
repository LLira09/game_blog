class CategoriesController < ApplicationController

  def index
    @categories = Category.all
  end

  def show
    @category = Category.find(params[:id])

  end
  
  def new 
    @category = Category.new
  end 

  def create
    @new_category = Category.new(category_params)
    @new_category.save
    redirect_to @new_category
  end 


  def edit
    @category = Category.find(params[:id])
    @categories = Category.all
  end

  def update
    category = Category.find(params[:id])
    category.update(category_params)
    category.save
    redirect_to category_path(category)
  end 

  private 

  def category_params
    params.require(:category).permit(:name)

  end


end
