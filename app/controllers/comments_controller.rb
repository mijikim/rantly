class CommentsController < ApplicationController

  def create
    create_comment

    if @comment.save
      redirect_to :back
    end
  end

  private

  def allowed_param
    params.require(:comment).permit(:comment)
  end

  def create_comment
    if params[:rant_id]
      @comment = Rant.find(params[:rant_id]).comments.build(allowed_params.merge(user_id: current_user.id))
    else
      @comment = User.find(params[:user_id]).comments.build(allowed_params.merge(user_id: current_user.id))
    end
  end

end