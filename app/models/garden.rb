class Garden < ApplicationRecord
	# validations

	# relationships
	has_many :env_measurements
	has_many :jobs
end
