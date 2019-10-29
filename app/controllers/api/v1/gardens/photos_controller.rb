class Api::V1::Gardens::PhotosController < ApplicationController
  before_action :set_garden, only: [:index, :create]

  def index 
    render json: PhotoSerializer.new(@garden.photos)
  end

  def create
    photo = Photo.new(photo_params)
    photo.garden_id = @garden.id
    if photo.save
      render json: PhotoSerializer.new(photo), status: :created
    else
      render json: "{ Job failed to record. }", status: :bad_request
    end
  end

  private 

  def set_garden
    @garden = Garden.find_by(id: params[:id])
    garden_not_found if @garden.nil?
  end

  def photo_params
    params.permit(:url)
  end
end