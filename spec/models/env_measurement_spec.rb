require 'rails_helper'

RSpec.describe EnvMeasurement, type: :model do
	describe "relationships" do
		it { should belong_to(:garden) }
	end

	describe	"validations" do
		it { should validate_numericality_of(:temperature) }
		it { should validate_numericality_of(:humidity) }

		it { should validate_numericality_of(:soil_moisture).
			is_greater_than_or_equal_to(0) }
	end
end
