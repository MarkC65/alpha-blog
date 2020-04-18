class ArticlesController < ApplicationController

  def show
    @article = Article.find(params[:id])
  end
  
  def index
    @articles = Article.all
  end

  def new
    @article = Article.new
  end

  def edit
    @article = Article.find(params[:id])
  end

  def create
    @article = Article.create(params.require(:article).permit(:title, :description))
    if @article.id
      flash[:top] = "Article created."
      redirect_to article_path(@article)
    else
      render 'new'
    end
  end

  def update
    @article = Article.find(params[:id])
    @article.update(params.require(:article).permit(:title, :description))
    if @article.id
      flash[:top] = "Article updated successfully."
      redirect_to article_path(@article)
    else
      render 'edit'
    end
  end
end
