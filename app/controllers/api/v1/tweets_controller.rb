class Api::V1::TweetsController < Api::V1::BaseController
  before_action :set_tweet, only: [:update, :show, :destroy]
  before_action :is_owner, only: [:update, :destroy]

  # GET api/v1/tweets
  def index
    @tweets = Tweet.lasts
    render json: ActiveModel::Serializer::CollectionSerializer.new(@tweets, serializer: Api::V1::TweetSerializer, root: 'tweets')
  end

  # GET api/v1/tweets/:id
  def show
    render json: Api::V1::TweetSerializer.new(@tweet)
  end

  # POST api/v1/tweets
  def create
    @tweet = Tweet.new(tweet_params)

    if @tweet.save
      render json: Api::V1::TweetSerializer.new(@tweet)
    else
      render status: 400, json: { errors: @tweet.errors.full_messages }
    end
  end

  # PUT/PATCH api/v1/tweets/:id
  def update
    if @tweet.update(tweet_params)
      render json: Api::V1::TweetSerializer.new(@tweet)
    else
      render status: 400, json: { errors: @tweet.errors.full_messages }
    end
  end

  # DELETE api/v1/tweets/:id
  def destroy
    @tweet.destroy
    render status: 204, nothing: true
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_tweet
    @tweet = Tweet.find(params[:id])
  end

  def tweet_params
    params.permit(:message).merge(user: current_user)
  end

  def is_owner
    raise NotAuthorized unless current_user == @tweet.user
  end
end
