class UsersController < ApplicationController
  
  #GET /users
  def index
    @users = User.all
  end
 
  #GET /users/:id
  def show
    @user = User.find params[:id]
  end
  
  
  #GET /users/new
  def new
    @user = User.new
  end
  
  #POST /users
  def create
    @user = User.new params[:user]
    
    if @user.save
      redirect_to @user
    else
      render action: 'new'
    end
  end
  
  
  def edit
    @user = User.find params[:id]
  end

  def update
    @user = User.find params[:id]
    if @user.update_attributes params[:user]
      redirect_to user_path(@user.id), notice: "Dane zmieniono."
    else
      render action: "edit"
    end
  end
  
  def destroy
    @user = User.find params[:id]
    @user.destroy
    redirect_to users_path
  end
  
end
