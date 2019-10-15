class WelcomeController < ActionController::Base
  def index
    render json: "Welcome to the Garden Pi api, you can view the documentation at https://github.com/Mycobee/garden_pi_be"
  end
end
