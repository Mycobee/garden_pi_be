class GardenSerializer < ActiveModel::Serializer
  attributes :id, :name, :latitude, :longitude, :env_measurements

	def env_measurements 
  	self.object.env_measurements.map do |measurement|
  		{id: measurement.id,
			soilMoisture: measurement.soil_moisture, 
			soilTemperature: measurement.soil_temperature,
			createdAt: measurement.created_at.strftime("%F %T")}
    end 
  end 
end
