require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Trails index" do
    before :each do
      @rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true )
      @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: true)
      @dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: true)
      @flattop_mountain = @rmnp_office.trails.create(name: 'Flattop Mountain', elevation: 2849, dogs_allowed: false)
    end

    it "Then I see each trail in the system including its attributes" do
      visit '/trails'

      # save_and_open_page

      expect(page).to have_content("All Trails")
      within('#trails') do
        expect(page).to have_content(@bear_lake.name)
        expect(page).to have_content(@bear_lake.elevation)
        expect(page).to have_content(@bear_lake.dogs_allowed)
      end

      within('#trails') do
        expect(page).to have_content(@dream_lake.name)
        expect(page).to have_content(@dream_lake.elevation)
        expect(page).to have_content(@dream_lake.dogs_allowed)
      end

      within('#trails') do
        expect(page).to_not have_content(@flattop_mountain.name)
        expect(page).to_not have_content(@flattop_mountain.elevation)
        expect(page).to_not have_content(@flattop_mountain.dogs_allowed)
      end
    end
  end
end
