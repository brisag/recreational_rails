require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I am directed to Update Form" do
    it "I can edit an office" do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )

      visit "/offices/#{@rmnp_office.id}/edit"

      fill_in "Name", with: "Office 1"
      fill_in "Capacity", with: "22"
      check "First Aid Available:"

      click_on "Update Office"

      expect(current_path).to eq("/offices/#{@rmnp_office.id}")
      expect(page).to have_content("Office 1")
      expect(page).to have_content(22)
      expect(page).to have_content "First Aid Available: true"
    end
  end
end
