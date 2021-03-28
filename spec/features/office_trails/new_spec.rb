require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "I see a form to create a new adoptable trail" do
    before :each do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
      @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)
    end

    it "I fill in a form with the trail's attributes" do
      visit "/offices/#{@rmnp_office.id}/trails/new"

      fill_in "Name", with: "Longs Peak"
      fill_in "Elevation", with: "4855"
      uncheck "Dogs Allowed?"

      click_on "Create Trail"

      expect(current_path).to eq("/offices/#{@rmnp_office.id}/trails")
      expect(page).to have_content("Longs Peak")
      expect(page).to have_content(4855)
      expect(page).to have_content("Dogs Allowed? false")
    end
  end
end
