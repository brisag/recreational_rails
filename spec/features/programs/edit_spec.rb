require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I am in the Update Program form" do
    it "I can edit a Program" do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
      @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)

      visit "/programs/#{@fishing.id}/edit"

      fill_in "Name", with: "Trail Running"
      fill_in "Number of Participants", with: "5"
      # check "Virtual"

      click_on "Update Program"

      expect(current_path).to eq("/programs/#{@fishing.id}")
      expect(page).to have_content("Trail Running")
      expect(page).to have_content(5)
      # expect(page).to have_content(false)
    end
  end
end
