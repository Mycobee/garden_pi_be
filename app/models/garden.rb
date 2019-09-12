class Garden < ApplicationRecord
	# validations

	# relationships
	has_many :env_measurements
	has_many :jobs

	def daily_avg_moisture(days)
		env_measurements.where("created_at >= ? AND created_at <= ?",
			Time.now.beginning_of_day - (days.to_i * 86400),
			Time.now.beginning_of_day)
		.group("DATE_TRUNC('day', created_at)")
		.order("date_trunc_day_created_at")
		.average(:soil_moisture)
	end

end
