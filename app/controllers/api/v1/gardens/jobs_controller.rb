class Api::V1::Gardens::JobsController < ApplicationController
  before_action :set_garden, only: [:index, :create]

  def index
    render json: JobSerializer.new(@garden.jobs)
  end

  def create
    job = Job.new(job_params)
    job.garden_id = @garden.id
    if job.save
      render json: JobSerializer.new(job), status: :created
    else
      render json: "{ Job failed to record. }", status: :bad_request
    end
  end

  private

  def job_params
    params.permit(:name)
  end

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    not_found if @garden.nil?
  end 
end
