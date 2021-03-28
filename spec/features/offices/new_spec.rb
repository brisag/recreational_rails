require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I am directed to New Form" do
    it "I can create a new office" do
      visit '/offices/new'

      fill_in "Name", with: "Office 1"
      fill_in "Capacity", with: "22"
      check "First Aid Available:"

      click_on "Create Office"

      expect(current_path).to eq("/offices")
      expect(page).to have_content("Office 1")
      expect(page).to have_content(22)
      expect(page).to have_content "First Aid Available: true"
    end
  end
end
