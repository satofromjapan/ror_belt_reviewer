class SessionsController < ApplicationController
  skip_before_action :require_login, except: [:destroy]
  def new
    #render login/registration page
  end

  def create
    @u =User.find_by_email(params[:email]).try(:authenticate, params[:password])

    if !@u
      flash[:errors] = ["Login: Invalid Credentials"]
      redirect_to "/"
    else
      session[:user_id] = @u.id
      redirect_to "/events"
    end
  end
  def destroy
    session[:user_id] = nil
    redirect_to "/"
  end
end
