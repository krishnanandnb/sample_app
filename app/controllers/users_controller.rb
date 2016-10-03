class UsersController < ApplicationController
  def new
  	@user=User.new
  end
   def show
    @user = User.find(params[:id])
  end
    def create
    @user = User.new(params[:user])
    flash[:success] = "Welcome to the Sample App! #{@user.name}"
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App! #{@user.name}"
      redirect_to @user

    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end
end
