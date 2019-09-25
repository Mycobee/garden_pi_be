class GardenSerializer
  include FastJsonapi::ObjectSerializer
  attributes :id, :name, :latitude, :longitude, :max_moisture, :min_moisture, :auto_water
end
