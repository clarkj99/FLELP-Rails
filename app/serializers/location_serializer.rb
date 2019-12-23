class LocationSerializer
  include FastJsonapi::ObjectSerializer
  attributes :name, :address1, :city, :state, :zip
  # belongs_to :user
end
