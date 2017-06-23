class JoinsController < ApplicationController
  def create
    @join = Join.create(join_params)
    redirect_to "/events"
  end

  def destroy
    @join = Join.find(params[:id])
    if @join.user == current_user
      @join.destroy
    end
    redirect_to "/events"
  end

  private
    def join_params
      params.require(:join).permit(:event_id).merge(user: current_user)
    end
end
