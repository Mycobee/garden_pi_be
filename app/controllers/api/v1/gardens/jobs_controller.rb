class Api::V1::Gardens::JobsController < ApplicationController
  before_action :set_garden, only: [:index, :create]

  def index
    if job_params[:seconds_ago] == nil
      render json: JobSerializer.new(@garden.jobs)
    elsif job_params[:seconds_ago].to_i > 0
      render json: JobSerializer.new(@garden.jobs.where('created_at >= ?', Time.now - job_params[:seconds_ago].to_i))
    else
      render json: "{ Job request failed. }", status: :bad_request
    end
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
    params.permit(:name, :seconds_ago)
  end

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    garden_not_found if @garden.nil?
  end
end
