class CategoriesController < ApplicationController

  def index
    @categories = Category.paginate(page: params[:page], per_page: 10)
  end

  def new
    @category = Category.new
  end

  def create
    @category = Category.new(params_require)
    if @category.save
      flash[:top] = "Category created successfully."
      redirect_to categories_path
    else
      render 'new'
    end
  end
  
  def show
  end

  def edit
  end

  def update
  end

  private
  def params_require
    params.require(:category).permit(:name)
  end
end