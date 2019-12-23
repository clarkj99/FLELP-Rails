class Api::V1::LocationsController < ApplicationController
  before_action :find_location, only: [:show, :update, :destroy]
  skip_before_action :authorized, only: [:index]

  def index
    @locations = Location.all
    # render json: LocationSerializer.new(@locations).serialized_json, status: :ok
    render json: @locations, status: :ok
  end

  def show
    render json: LocationSerializer.new(@location).serialized_json, status: :ok
  end

  def create
    @location = current_user.locations.create(location_params)
    if @location.valid?
      @location.save
      render json: @location, status: :ok
    else
      render json: { error: @location.errors.full_messages[0] }, status: :bad_request
    end
  end

  def update
    if @location.update(location_params)
      render json: @location, status: :accepted
    else
      render json: { error: @location.errors.full_messages[0] }, status: :bad_request
    end
  end

  def destroy
    @location.destroy
  end

  private

  def find_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:name, :address1, :address2, :city, :state, :zip)
  end
end
