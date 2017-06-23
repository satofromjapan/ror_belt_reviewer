class CommentsController < ApplicationController
  def create
    @comment = Comment.create(comment_params)
    redirect_to "/events/#{params[:comment][:event_id]}"
  end

  private
    def comment_params
      params.require(:comment).permit(:event_id, :content).merge(user: current_user)
    end
end
