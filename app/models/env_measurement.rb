class EnvMeasurement < ApplicationRecord
	belongs_to :garden

	validates_numericality_of :soil_temperature
	validates_numericality_of :soil_moisture, greater_than_or_equal_to: 0
end
