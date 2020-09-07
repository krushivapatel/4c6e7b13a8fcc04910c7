class RelationshipsController < ApplicationController
    def create
        other_user = User.find_by(id: params[:followed_id])
        if other_user.present? && current_user == other_user
            render json: { success: false, message: "Can not follow yourself." }, status: 400
        elsif other_user.present? && current_user.following?(other_user)
            render json: { success: false, message: "Already following." }, status: 400
        elsif other_user.present?
            relationship = current_user.follow!(other_user)
            if relationship
                render json: { success: true, message: "Successfully followed this user." }, status: 200
            else
                render json: { success: false, message: "Error while following this user. Please try later." }, status: 400
            end
        else
            render json: { success: false, message: "No user found." }, status: 400
        end
    end

    def destroy
        other_user = Relationship.find_by(id: params[:id])&.followed
        if other_user.present? && !current_user.following?(other_user)
            render json: { success: false, message: "You're not following this user." }, status: 400
        elsif other_user.present?
            relationship = current_user.unfollow!(other_user)
            if relationship
                render json: { success: true, message: "Successfully unfollowed this user." }, status: 200
            else
                render json: { success: false, message: "Error while unfollowing this user." }, status: 400
            end
        else
            render json: { success: false, message: "No record found." }, status: 400
        end
    end

    # Method to get current user's profile
    def profile
        render json: current_user, status: 200
    end

    # Method to get other user's profile
    def user_profile
        user = User.find_by(id: params[:user_id])
        if user.present?
            render json: user, status: 200
        else
            render json: { success: false, message: "No user found." }, status: 400
        end
    end
end
