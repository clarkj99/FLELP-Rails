class Api::V1::FavoriteBusinessesController < ApplicationController
  before_action :find_favorite_business, only: [:destroy]

  def index
    @favorite_businesses = current_user.favorite_businesses
    render json: @favorite_businesses, status: :ok
  end

  def destroy
    @favorite_business.destroy
    render json: @favorite_business, status: :ok
  end

  def create
    @favorite_business = current_user.favorite_businesses.create(business_id: favorite_business_params[:id], name: favorite_business_params[:name], latitude: favorite_business_params[:coordinates][:latitude], longitude: favorite_business_params[:coordinates][:longitude], image_url: favorite_business_params[:image_url], phone: favorite_business_params[:display_phone], location: favorite_business_params[:location][:display_address].join(" "))
    if @favorite_business.valid?
      render json: @favorite_business, status: :ok
    else
      render json: { error: @favorite_business.errors.full_messages[0] }, status: :bad_request
    end
  end

  private

  def find_favorite_business
    @favorite_business = current_user.favorite_businesses.find_by(business_id: params[:id])
  end

  def favorite_business_params
    params.require(:business).permit(:id, :name, :display_phone, :image_url, location: [display_address: []], coordinates: [:latitude, :longitude])
  end
end
