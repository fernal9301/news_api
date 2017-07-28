class NewsController < ApplicationController
  before_action :set_user
	before_action :set_user_news, only: [:show, :update, :destroy] 

  def index
		render json: @user.news, status: :ok
  end

  def show 
		render json: @news, status: :ok
  end

  def create
		@user.news.create!(news_params)
    render json: @user, status: :created
  end

  def update
		@news.update(news_params)
		head :no_content
  end

  def destroy
		@news.destroy
    head :no_content
  end

  private 

  def set_user
  	@user = User.find(params[:user_id])
  end

  def set_user_news
    @news = @user.news.find_by!(id: params[:id]) if @user
  end

  def news_params
	  params.require(:news).permit(:date, :title, :content, :sources, :user_id)	
  end
end
