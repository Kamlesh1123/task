class CommentsController < ApplicationController

  def show
    @comment = Comment.find(params[:ids])
  end

 def create
  #debugger
  
  @comment= @entry.comments.create(comment_params)
  @comment.user_id = current_user.id
  @comment.save
  @comments = @entry.comments
  respond_to do |format|
    format.js
   #redirect_to entry_path(@entry)
  end
end

 def destroy
  @entry = Entry.find params[:entry_id]
  @comment = @entry.comments.find params[:id]
  @comment.destroy
  redirect_to entry_path(@entry)
 end


  private
    def comment_params
      params.require(:comment).permit(:commenter, :body)
    end
end