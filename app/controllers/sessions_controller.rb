class SessionsController < ApplicationController
	def new
	end

	def create
    user = User.find_by(email: params[:session][:email].downcase)
    @user = user.authenticate(params[:session][:password])
    # byebug
    if @user 
      log_in(@user)
      redirect_to bookmarks_path
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
