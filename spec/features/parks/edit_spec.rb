require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I am directed to Update Form" do
    it "I can edit a Park" do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )

      visit "/parks/#{@grand_canyon.id}/edit"

      fill_in "Name", with: "Little Canyon"
      fill_in "Capacity", with: "44"
      check "Permit Required?"

      click_on "Update Park"

      expect(current_path).to eq("/parks/#{@grand_canyon.id}")
      expect(page).to have_content("Little Canyon")
      expect(page).to have_content(44)
      expect(page).to have_content ('Permit Required: true')
    end
  end
end
