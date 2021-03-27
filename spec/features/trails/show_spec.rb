require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Trail show page" do
    before :each do
      @rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true )
      @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)
      @dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: false)
      @flattop_mountain = @rmnp_office.trails.create(name: 'Flattop Mountain', elevation: 2849, dogs_allowed: false)
    end

    it "Then I see the trail with that id including the trail's attributes" do
      visit "/trails/#{@bear_lake.id}"

      # save_and_open_page

      expect(page).to have_content("Trail")
      expect(page).to have_content(@bear_lake.name)
      expect(page).to have_content(@bear_lake.elevation)
      expect(page).to have_content(@bear_lake.dogs_allowed)
    end

    it "Shows a link to update Program and am redirected to update form." do
      visit "/trails/#{@bear_lake.id}"

      expect(page).to have_link("Update Trail")
      click_link "Update Trail"
      expect(current_path).to eq("/trails/#{@bear_lake.id}/edit")
    end
  end
end
