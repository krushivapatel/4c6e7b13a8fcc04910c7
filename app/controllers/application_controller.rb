class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  protect_from_forgery with: :null_session
  before_action :authenticate_with_token!

  respond_to :json

  # overwriting devise method
  def current_user
    token = request.headers['Authorization'].presence
    if token
      @current_user ||= User.find_by_auth_token(token)
    end
  end

  def authenticate_with_token!
    render json: { errors: "Not authenticated." }, status: 401 unless current_user.present?
  end

end
