class ArticlesController < ApplicationController
  before_action :require_user, except: [:show, :index]
  



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
    @new_article.user = current_user
    if @new_article.save
      flash[:notice] = "Article was created successfully"
      redirect_to articles_path(@new_article)
    else
      render 'new'
    end
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
    params.require(:article).permit(:title, :content, category_ids:[])

  end

 



end
