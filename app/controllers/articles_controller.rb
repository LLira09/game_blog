class ArticlesController < ApplicationController



  def index
    @articles = Article.all
  end

  def show
    @article = Article.find(params[:id])
    @comments = Comment.where(article_id: @article.id)
  end

  def new
    @article = Article.new
    @user = User.all
    @categories = Category.all
  end

  def create
   
    new_article = Article.new(article_params)
    new_article.user = current_user
    if !new_article.valid?
      flash[:errors] = new_article.errors.full_messages
      redirect_to new_article_path
    else 
      new_article.save
      flash[:notice] = "Article was created successfully"
      redirect_to articles_path(new_article)
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


private 

  def article_params
    params.require(:article).permit(:title, :content, :user_id, category_ids:[])

  end

  def comment_params
    params.require(:comment).permit(:content)

  end


end
