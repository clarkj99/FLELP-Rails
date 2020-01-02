class Api::V1::BusinessesController < ApplicationController
  skip_before_action :authorized, only: [:show]
  before_action :find_location, only: [:index]

  def index
    key = ENV["YELP_API_KEY"]
    loc = [@location.address1, @location.city, @location.state, @location.zip].join(" ")
    term = "restaurants"
    url = "https://api.yelp.com/v3/businesses/search?sort_by=" + params[:sort] + "&limit=50&term=" + term + "&location=" + loc
    headers = { authorization: "Bearer " + key }
    begin
      response = RestClient.get(url, headers)
    rescue RestClient::ExceptionWithResponse => err
      render json: err.response.to_s
    else
      render json: response, status: :ok
    end
  end

  def show
    key = ENV["YELP_API_KEY"]
    url = "https://api.yelp.com/v3/businesses/" + params[:id]
    headers = { authorization: "Bearer " + key }

    begin
      retries ||= 0
      response = RestClient.get(url, headers)
    rescue RestClient::ExceptionWithResponse => err
      sleep 0.8
      retry if (retries += 1) <= 5
      render json: err.response.to_s
    else
      render json: response, status: :ok
    end
  end

  private

  def find_location
    @location = current_user.locations.find_by(id: params[:location_id].to_i)
  end
end
