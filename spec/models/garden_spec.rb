require 'rails_helper'

RSpec.describe Garden, type: :model do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :latitude }
    it { should validate_presence_of :longitude }
    it { should validate_numericality_of :latitude }
    it { should validate_numericality_of :longitude  }
    it { should validate_numericality_of :max_moisture  }
    it { should validate_numericality_of :min_moisture  }
  end

	describe "relationships" do
		it { should have_many :env_measurements }
		it { should have_many :jobs }
		it { should belong_to :user }
	end

	describe "#daily_avg" do
		before :each do
			@garden = create(:garden)

			today = Time.zone.now.beginning_of_day

			one_day_ago    = today          - 86400
			two_days_ago   = one_day_ago    - 86400
			three_days_ago = two_days_ago   - 86400
			four_days_ago  = three_days_ago - 86400
			five_days_ago  = four_days_ago  - 86400
			six_days_ago   = five_days_ago  - 86400
			seven_days_ago = six_days_ago   - 86400
			eight_days_ago = seven_days_ago - 86400
			x = 0

			until today == one_day_ago
			  @garden.env_measurements.create!(soil_temperature: 10, soil_moisture: 10, created_at: x.minutes.ago)
			  today = today - 900
			  x = x + 15
			end

			until one_day_ago == two_days_ago
			  @garden.env_measurements.create!(soil_temperature: 20, soil_moisture: 20, created_at: x.minutes.ago)
			  one_day_ago = one_day_ago - 900
			  x = x + 15
			end

			until two_days_ago == three_days_ago
			  @garden.env_measurements.create!(soil_temperature: 30, soil_moisture: 30, created_at: x.minutes.ago)
			  two_days_ago = two_days_ago - 900
			  x = x + 15
			end

			until three_days_ago == four_days_ago
			  @garden.env_measurements.create!(soil_temperature: 40, soil_moisture: 40, created_at: x.minutes.ago)
			  three_days_ago = three_days_ago - 900
			  x = x + 15
			end

			until four_days_ago == five_days_ago
			  @garden.env_measurements.create!(soil_temperature: 50, soil_moisture: 50, created_at: x.minutes.ago)
			  four_days_ago = four_days_ago - 900
			  x = x + 15
			end

			until five_days_ago == six_days_ago
			  @garden.env_measurements.create!(soil_temperature: 60, soil_moisture: 60, created_at: x.minutes.ago)
			  five_days_ago = five_days_ago - 900
			  x = x + 15
			end

			until six_days_ago == seven_days_ago
			  @garden.env_measurements.create!(soil_temperature: 70, soil_moisture: 70, created_at: x.minutes.ago)
			  six_days_ago = six_days_ago - 900
			  x = x + 15
			end

			until seven_days_ago == eight_days_ago
			  @garden.env_measurements.create!(soil_temperature: 80, soil_moisture: 80, created_at: x.minutes.ago)
			  seven_days_ago = seven_days_ago - 900
			  x = x + 15
			end
    end

		it "returns daily average moisture for given number of days" do
			expect(@garden.daily_avg_moisture(1).count).to eq(1)
			expect(@garden.daily_avg_moisture(2).count).to eq(2)
			expect(@garden.daily_avg_moisture(3).count).to eq(3)
			expect(@garden.daily_avg_moisture(7).count).to eq(7)
		end
	end
end
