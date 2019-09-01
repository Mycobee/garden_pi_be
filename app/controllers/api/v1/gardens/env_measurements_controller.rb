class Api::V1::Gardens::EnvMeasurementsController < ApplicationController
	def index
		garden = Garden.find(params[:id])
		render json: GardenSerializer.new(garden)	
	end	
end
