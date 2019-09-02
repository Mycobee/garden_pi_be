require 'rails_helper'

RSpec.describe EnvMeasurement, type: :model do
	describe "relationships" do
		it { should belong_to(:garden) }
	end
end
