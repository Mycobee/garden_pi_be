class Api::V1::GardensController < ApplicationController
  before_action :set_garden, only: [:show]

	def show
    render json: GardenSerializer.new(@garden)	
	end	

  def create
    auth_key = request.headers["Authorization"]
    user = User.find_by(api_key: auth_key)
    garden = user.gardens.create(garden_params) 
    render json: GardenSerializer.new(garden), status: :created
  end

  private

  def garden_params
    params.require(:garden).permit(:name, :latitude, :longitude, :max_moisture, :min_moisture, :auto_water)
  end

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    not_found if @garden.nil?  
  end
end
