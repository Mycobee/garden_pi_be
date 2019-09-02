class Api::V1::Gardens::EnvMeasurementsController < ApplicationController
  before_action :set_garden, only: [:index]

	def index
    render json: EnvMeasurementSerializer.new(@garden.env_measurements)	
	end	

  private

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    not_found if @garden.nil?  
  end
end
