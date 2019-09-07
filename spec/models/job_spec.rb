require 'rails_helper'

RSpec.describe Job, type: :model do
  describe	"validations" do
		it { should validate_presence_of :name }
	end

  describe	"relationships" do
		it { should belong_to :garden }
	end
end
