class Api::V1::Gardens::DailyAvgMoistureController < ApplicationController
  before_action :set_garden, only: [:index]

  def index
    render json: DailyAvgMoistureSerializer.new(@garden.daily_avg_moisture(daily_avg_moisture_params[:days])).daily_avg, status: :ok
  end

  private

  def daily_avg_moisture_params
    params.permit(:days)
  end

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    not_found if @garden.nil?
  end

end
