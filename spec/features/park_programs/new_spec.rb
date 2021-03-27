require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I see a form to create a new program" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false, created_at: "1918-04-13 14:45:55" )
      @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
      @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
    end

    it "I fill in a form with the trail's attributes" do
      visit "/parks/#{@grand_canyon.id}/programs/new"

      fill_in "Name", with: "Sunrise Yoga"
      fill_in "Num of participants", with: "27"
      # check "Virtual Program?"

      click_on "Create Program"

      expect(current_path).to eq("/parks/#{@grand_canyon.id}/programs")
      expect(page).to have_content("Sunrise Yoga")
      expect(page).to have_content(27)
      # expect(page).to have_content(false)
    end
  end
end
