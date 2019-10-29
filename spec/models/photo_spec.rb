require 'rails_helper'

RSpec.describe Photo, type: :model do
  describe	"validations" do
		it { should validate_presence_of :url }
	end
end
