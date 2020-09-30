class CommentsController < ApplicationController





def create 
    byebug
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(params[:comment].permit(:comment, :current_user, :article_id))
    @comment.save
    redirect_to article_path(@comment)  
end

# def comment_params
#     params.require(:comment).permit(:comment, :current_user, :article_id)
# end 


end
