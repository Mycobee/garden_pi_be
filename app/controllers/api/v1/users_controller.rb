class Api::V1::UsersController < ApplicationController

  def create
    user = User.find_by(email: user_params[:email])
    if user.nil? && passwords_match
      user = User.new(user_params)
      if user.save
        render json: UserSerializer.new(user), status: :created
      else
        render json: "{ Something went wrong. Please try again. }", status: :bad_request
      end
    elsif user && user.authenticate(params[:password])
      render json: UserSerializer.new(user), status: :ok
    else
      render json: "{ Please check that passwords match. }", status: :bad_request
    end
  end

  private

  def passwords_match
    user_params[:password] == user_params[:password_confirmation]
  end

  def user_params
    params.permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end
