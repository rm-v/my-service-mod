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
    
  end

  def update
    
  end
  
  def destroy
    
  end
  
end
