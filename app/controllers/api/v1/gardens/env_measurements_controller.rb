class Api::V1::Gardens::EnvMeasurementsController < ApplicationController
	def index
		garden = Garden.find_by(id: params[:id])
		not_found if garden.nil?
		render json: GardenSerializer.new(garden)	
	end	
end
