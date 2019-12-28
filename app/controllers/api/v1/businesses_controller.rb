class Api::V1::BusinessesController < ApplicationController
  # skip_before_action :authorized, only: [:index, :show]
  before_action :find_location

  def index
    key = ENV["YELP_API_KEY"]
    loc = [@location.address1, @location.city, @location.state, @location.zip].join(" ")
    term = "restaurants"
    url = "https://api.yelp.com/v3/businesses/search?limit=50&rterm=" + term + "&location=" + loc
    headers = { authorization: "Bearer " + key }
    response = RestClient.get(url, headers)
    render json: response, status: :ok
  end

  def show
  end

  def create
  end

  def destroy
  end

  private

  def find_location
    @location = current_user.locations.find_by(id: params[:location_id].to_i)
  end
end
