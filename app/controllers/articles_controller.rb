class ArticlesController < ApplicationController
  before_action :set_article, only: [:show, :edit, :update, :destroy]

  def show
  end
  
  def index
    @articles = Article.paginate(page: params[:page], per_page: 10)
  end

  def new
    @article = Article.new
  end

  def edit
  end

  def create
    @article = Article.create(params_require)
    @article.user = User.first
    if @article.id
      flash[:top] = "Article created successfully."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article.update(params_require)
    if @article.id
      flash[:top] = "Article updated successfully."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end

  def destroy
    @article.destroy
    redirect_to articles_path
  end

  private
  def set_article
    @article = Article.find(params[:id])
  end

  def params_require
    params.require(:article).permit(:title, :description)
  end

end
