class UsersController < ApplicationController
  before_action :set_user, only: [:update, :destroy]

  def create
    @user = User.create(user_params) 
      if @user.save
        render json: @user, status: :created
      else
        render json: @user, status: :unprocessable_entity
      end
  end
  
  def update
    if check_token? 
      @user.update(user_params)
      head :no_content
    end 
  end

  def destroy
    if check_token? 
      @user.destroy
      head :no_content
    end 
  end
  
  private 
   
  def set_user
    @user = User.find(params[:id]) 
  end
 
  def user_params
    params.require(:user).permit(:email, :password, :token)
  end

  def check_token?
    params[:user][:token] == @user.token
  end
end

