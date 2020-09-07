class TweetsController < ApplicationController
    
    def index
        user = User.find_by(id: params[:user_id])
        if user.present?
            p user.following
            sort_attribute = params['sort']&.sub("-", "")
            sort_order = params['sort']&.starts_with?("-") ? :desc : :asc
            following_ids = user.following.pluck(:id)
            tweets = Tweet.where(user_id: following_ids).includes(:user)
            tweets.order!(sort_attribute => sort_order) if sort_attribute.present? && sort_order.present?
            render json: tweets, status: 200
        else
            render json: { success: false, error: "No user found."}, status: 400
        end
    end

    def create
        tweet = current_user.tweets.build(tweet_params)
        if tweet.save
            render json: tweet, status: 200
        else
            render json: { success: false, error: "Error while creating tweet. Please try later."}, status: 400
        end
    end
    
    private

    def tweet_params
        params.require(:tweet).permit(:content)
    end
end
