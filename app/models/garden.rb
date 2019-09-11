class Garden < ApplicationRecord
	# validations

	# relationships
	has_many :env_measurements
	has_many :jobs

	def daily_avg_moisture(days)
		x = env_measurements.where("created_at >= ? AND created_at <= ?",
			Time.now.beginning_of_day - (days * 86400),
			Time.now.beginning_of_day)
		.group("DATE_TRUNC('day', created_at)")
		.average(:soil_moisture)
	end

end
