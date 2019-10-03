class Garden < ApplicationRecord
	# validations
  validates_presence_of :name, :latitude, :longitude
  validates_numericality_of :latitude, :longitude, :max_moisture, :min_moisture
  validates :min_moisture, presence: true, if: :auto_water

	# relationships
	has_many :env_measurements
	has_many :jobs
	belongs_to :user
	has_many :photos

	def daily_avg_moisture(days)
		env_measurements.where("created_at >= ? AND created_at <= ?",
			Time.now.beginning_of_day - (days.to_i * 86400),
			Time.now.beginning_of_day)
		.group("DATE_TRUNC('day', created_at)")
		.order("date_trunc_day_created_at")
		.average(:soil_moisture)
	end

end
