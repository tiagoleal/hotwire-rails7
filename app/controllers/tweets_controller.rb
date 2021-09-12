class TweetsController < ApplicationController
  before_action :set_tweet, only: %i[show edit update destroy]

  def index
    @tweets = Tweet.all.order(created_at: :desc)
    @tweet = Tweet.new
  end

  def create
    @tweet = Tweet.new(tweet_params)

    respond_to do |format|
      if @tweet.save
        format.html do
          redirect_to tweets_path
        end
        format.json { render :show, status: :created, location: @tweet }
      else
        format.turbo_stream do
          render turbo_stream: turbo_stream.replace(
            @tweet, partial: 'tweets/form', locals: { tweet: @tweet }
          )
        end
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @tweet.errors, status: :unprocessable_entity }
      end
    end
  end
 
  def edit; end
 
  def update
    if params[:like] == 'true'
      @tweet.increment!(:likes)
      respond_to do |format|
        format.html { redirect_to @tweet }
        format.json { render :show, status: :ok, location: @tweet }
      end
    else
      respond_to do |format|
        if @tweet.update(tweet_params)
          format.html { redirect_to @tweet }
          format.json { render :show, status: :ok, location: @tweet }
        else
          format.turbo_stream do
            render turbo_stream: turbo_stream.replace(
              @tweet, partial: 'tweets/form', locals: { tweet: @tweet }
            )
          end
          format.html { render :edit, status: :unprocessable_entity }
          format.json { render json: @tweet.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def show; end

  def destroy
    @tweet.destroy
    respond_to do |format|
      format.html { redirect_to tweets_url }
      format.json { head :no_content }
    end
  end

  private

  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.require(:tweet).permit(:body, :likes)
  end
end