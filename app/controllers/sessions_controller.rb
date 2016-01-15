class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user
   		@user = user.authenticate(params[:session][:password])
       if @user
       		session[:user_id] = @user.id
      		redirect_to bookmarks_path and return
      	end
     end
      		flash[:error] = "Wrong password"
      		render 'new'
    	end

  def destroy
    session[:user_id] = nil
    redirect_to root_path
  end
end


