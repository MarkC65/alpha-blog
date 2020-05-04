class CategoriesController < ApplicationController
  before_action :require_admin, except: [:index, :show]

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

  private
  
  def params_require
    params.require(:category).permit(:name)
  end

  def require_admin
    if !logged_in? || !current_user.admin?
      flash[:top] = "You are not permitted to perform that action!"
      redirect_to categories_path
    end
  end

end