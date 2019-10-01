require 'rails_helper'

RSpec.describe 'Welcome page', type: :feature do
  it 'displays a simple welcome message' do
    visit root_path

    expect(page).to have_content('GardenPi')

    ['Billy Urrutia', 'Brian Plantico', 'Colby Allen', 'David Engel', 'Rob Stringer'].each do |teammate|
      expect(page).to have_link teammate
    end
  end
end
