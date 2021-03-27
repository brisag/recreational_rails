require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I am directed to Update Form" do
    it "I can edit an office" do
      @rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true )
      @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)

      visit "/trails/#{@bear_lake.id}/edit"

      fill_in "Name", with: "Lake of Glass"
      fill_in "Elevation", with: "1677"
      # check "First Aid"

      click_on "Update Trail"

      expect(current_path).to eq("/trails/#{@bear_lake.id}")
      expect(page).to have_content("Lake of Glass")
      expect(page).to have_content(1677)
      # expect(page).to have_content(false)
    end
  end
end
