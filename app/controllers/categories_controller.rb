class CategoriesController < ApplicationController
  before_action :authenticate_user!
  def index
    @page_name = 'Categories'
    @categories = current_user.categories
  end
    
  def new 
    @page_name = 'Create Category'
    @category = Category.new
  end

  def create 
    @category = Category.new(category_params.merge(user: current_user))

    if @category.save
      redirect_to categories_path
      flash[:notice] = 'Category was successfully added.'
    else
      flash[:alert] = "Couldn't add this Category to your categories list."
      render :new
    end
  end

  def category_params
    params.require(:category).permit(:name, :icon)
  end
end
