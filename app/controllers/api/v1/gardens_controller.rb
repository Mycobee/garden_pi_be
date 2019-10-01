class Api::V1::GardensController < ApplicationController
  before_action :set_garden, only: [:show]
  before_action :authenticate_user, only: [:show, :create]

	def show
    render json: GardenSerializer.new(@garden)
	end

  def create
    garden = @user.gardens.new(garden_params)
    if garden.save
      render json: GardenSerializer.new(garden), status: :created
    else
      bad_request
    end
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :latitude, :longitude, :max_moisture, :min_moisture, :auto_water)
  end

  def authenticate_user
    auth_key = request.headers["Authorization"]
    @user = User.find_by(api_key: auth_key)
    unauthorized if @user.nil?
  end

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    garden_not_found if @garden.nil?
  end
end
