require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I am directed to New Form" do
    it "I can create a new park" do
      visit '/parks/new'

      fill_in "Name", with: "Park 1"
      fill_in "Capacity", with: "23"
      check "Permit Required?"

      click_on "Create Park"

      expect(current_path).to eq("/parks")
      expect(page).to have_content("Park 1")
      expect(page).to have_content(23)
      expect(page).to have_content ('Permit Required: true')
    end
  end
end
