class ArticlesController < ApplicationController



  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @categories = Category.all
  end

  def create
    byebug
    @new_article = Article.create(article_params)
    @new_article.save
    redirect_to articles_path(@new_article)
  end 

  def article_params
    params.require(:article).permit(:title,:content, category_ids:[])

  end


end
