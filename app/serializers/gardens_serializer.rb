class GardenSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :env_measurements

	def env_measurements 
  	self.object.env_measurements.map do |measurement|
  		{soilMoisture: measurement.soil_moisture, 
			soilTemperature: measurement.soil_temperature}
    end 
  end 
end
