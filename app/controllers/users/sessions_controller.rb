# frozen_string_literal: true

class Users::SessionsController < Devise::SessionsController
  # before_action :configure_sign_in_params, only: [:create]
  before_action :ensure_params_exists, only: :create
  skip_before_action :authenticate_with_token!, only: :create
  skip_before_action :verify_signed_out_user, only: :destroy

  def create
    resource = User.find_for_database_authentication(email: params[:user][:email])
    return invalid_login_attempt unless resource
    if resource.valid_password?(params[:user][:password])
      sign_in resource, store: false
      resource.generate_auth_token!
      resource.save
      render json: { success: true, message: "Login successful", data: {id: resource.id, email: resource.email, auth_token: resource.auth_token, created_at: resource.created_at, updated_at: resource.updated_at} }, status: 200
    else
      invalid_login_attempt
    end
  end

  def destroy
    sign_out(current_user)
    current_user.update(auth_token: nil)
    render json: { success: true, message: "Logged out successful" }, status: 200
  end

  private

  def invalid_login_attempt
    warden.custom_failure!
    render json: { success: false, message: "Username/password incorrect." }, status: 400
  end

  def ensure_params_exists
    return unless params[:user].blank? || params[:user][:email].blank? || params[:user][:password].blank?
    render json: { success: false, message: "Missing user parameters." }, status: 400
  end
  # GET /resource/sign_in
  # def new
  #   super
  # end

  # POST /resource/sign_in
  # def create
  #   super
  # end

  # DELETE /resource/sign_out
  # def destroy
  #   super
  # end

  # protected

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_in_params
  #   devise_parameter_sanitizer.permit(:sign_in, keys: [:attribute])
  # end
end
