class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email].downcase)
    if user.nil?
      user = User.new(user_params)
      user.update(email: user_params[:email].downcase)
      if user.save
        render json: UserSerializer.new(user), status: :created
      else
        render json: "{ Something went wrong. Please ensure matching passwords, valid email, first name, and last name, then try again. }".to_json, status: :bad_request
      end
    elsif user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :ok
    end
  end

  private

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
