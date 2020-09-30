class CommentsController < ApplicationController





def create 
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(params[:comment].permit(:comment))
    @comment.user = current_user
    @comment.save
    redirect_to article_path(@article)  
end

end
