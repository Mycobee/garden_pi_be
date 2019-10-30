class EnvMeasurement < ApplicationRecord
	belongs_to :garden

	validates_numericality_of :temperature
	validates_numericality_of :humidity
	validates_numericality_of :soil_moisture, greater_than_or_equal_to: 0
end
