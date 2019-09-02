class GardenSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :latitude, :longitude
end
