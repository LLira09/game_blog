class ArticlesController < ApplicationController



  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
  end

  def new
    @article = Article.new
    @user = User.all
    @categories = Category.all
  end

  def create
    @new_article = Article.new(article_params)
    @new_article.save
    redirect_to articles_path(@new_article)
  end 


  def edit
    @article = Article.find(params[:id])
    @user = User.all
    @categories = Category.all
  end

  def update
    article = Article.find(params[:id])
    article.update(article_params)
    article.save
    redirect_to article_path(article)
  end 

  def destroy
    @article = Article.find(params[:id])
    @article.destroy 
    redirect_to articles_path
  end


private 

  def article_params
    params.require(:article).permit(:title, :content, :user_id, category_ids:[])

  end


end
