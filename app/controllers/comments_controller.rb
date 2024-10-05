class CommentsController < ApplicationController
  def create
    @comment = current_user.comments.build(comment_params)

    if @comment.save
      redirect_to @comment.post, notice: "Comment was successfully created."
    else
      redirect_back fallback_location: root_path, alert: "There was an error creating your comment."
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:content, :post_id, :comment_id)
  end
end
