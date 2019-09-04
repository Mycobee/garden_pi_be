class Api::V1::Gardens::EnvMeasurementsController < ApplicationController
  before_action :set_garden, only: [:index, :create]

	def index
    render json: EnvMeasurementSerializer.new(@garden.env_measurements)
	end

  def create
    env_measurement = EnvMeasurement.new(env_params)
    env_measurement.garden_id = @garden.id
    if env_measurement.save
      render json: EnvMeasurementSerializer.new(env_measurement), status: :created
    else
      render json: "{ Environment measurements failed to record. }", status: :bad_request
    end
  end

  private

  def env_params
    params.permit(:soil_temperature, :soil_moisture)
  end

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    not_found if @garden.nil?
  end
end
