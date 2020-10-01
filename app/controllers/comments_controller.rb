class CommentsController < ApplicationController





def create 
    byebug
    @article = Article.find(params[:article_id])
    @comment = @article.comments.new(params[:comment].permit(:comment, :current_user, :article_id))
    @comment.save
    redirect_to article_path(@article)  

    if !@comment.valid?
        flash[:errors] = @comment.errors.full_messages
      else 
        @comment.save
        redirect_to article_path(@comment)
      end
      
end

# def comment_params
#     params.require(:comment).permit(:comment, :current_user, :article_id)
# end 


end
