class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
    @title = @user.name
  end
  
  def new
    @user=User.new
    @title="Sign up"
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to the Sample App!"
      redirect_to user_path(@user) # alt: redirect_to @user
    else
      @user.password=""              # Exercise 8.6.2
      @user.password_confirmation="" # Exercise 8.6.2
      @title ="Sign up"
      render 'new'
    end
  end
end
