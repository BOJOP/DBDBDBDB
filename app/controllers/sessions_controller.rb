class SessionsController < ApplicationController
  def new
    render layout: "layouts/free"
  end

  def create
    personnel = Personnel.find_by(email: params[:session][:email].downcase)
    if personnel && personnel.authenticate(params[:session][:password])
      log_in personnel
      params[:session][:remember_me] == '1' ? remember(personnel) : forget(personnel)
      redirect_back_or personnel
    else
      flash.now[:danger] = "Invalid email/password combination"
      render 'new'
    end
    
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
