class TweetsController < ApplicationController
  before_action :set_tweet, only:[:edit, :update, :destroy]

  def index
    @tweets = Tweet.all
  end
  
  def new
    @tweet = Tweet.new
  end
  
  def create
    @tweet = Tweet.new(tweets_params)
    if @tweet.save
      redirect_to tweets_path, notice: 'つぶやきました'
    else
      render'new'
    end
  end
  
  def update
    if @tweet.update(tweets_params)
      redirect_to tweets_path, notice: "つぶやき直しました"
    else
      render 'edit'
    end
  end
  
  def destroy
    @tweet.destroy
      redirect_to tweets_path
  end

  
  def edit
  end
  
  def confirm
    @tweet = Tweet.new(tweets_params)
  end
  
  private 
  def tweets_params
    params.require(:tweet).permit(:content)
  end
    
    def set_tweet
      @tweet = Tweet.find(params[:id])
    end
  end


