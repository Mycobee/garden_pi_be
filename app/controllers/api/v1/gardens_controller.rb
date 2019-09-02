class Api::V1::GardensController < ApplicationController
  before_action :set_garden, only: [:show]

	def show
    render json: GardenSerializer.new(@garden)	
	end	

  private

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    not_found if @garden.nil?  
  end
end
