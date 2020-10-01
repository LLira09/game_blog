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
    new_category = Category.new(category_params)
    if !new_category.valid?
      flash[:errors] = new_category.errors.full_messages
      redirect_to new_category_path
    else 
      new_category.save
      flash[:notice] = "Category was created successfully"
      redirect_to categories_path(new_category)
    end
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
