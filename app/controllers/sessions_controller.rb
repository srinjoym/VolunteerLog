class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      @visitor_log = current_user.visitor_logs.last
      if !@visitor_log.nil?&&@visitor_log.time_out.nil?
        redirect_to current_user.visitor_logs.last
      else
        redirect_to visitor_logs_new_path
      end

    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
  
end