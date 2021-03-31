require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit 'offices/:office_id/trails_table_name'" do
    before :each do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
      @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)
      @dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: false)
      visit "/offices/#{@rmnp_office.id}/trails"
    end

    it "I see each trail that is associated with that office with each trail's attributes" do
      expect(page).to have_link("#{@rmnp_office.name}")

      expect(page).to have_content(@bear_lake.name)
      expect(page).to have_content(@bear_lake.elevation)
      expect(page).to have_content(@bear_lake.dogs_allowed)

      expect(page).to have_content(@dream_lake.name)
      expect(page).to have_content(@dream_lake.elevation)
      expect(page).to have_content(@dream_lake.dogs_allowed)
    end

    it "Expect to see a link to create a new Trail" do
      expect(page).to have_link("Create Trail")
      click_link "Create Trail"
      expect(current_path).to eq("/offices/#{@rmnp_office.id}/trails/new")
    end

  it "shows a link to sort trails in abc" do
      expect(page).to have_link("Sort Alphabetically")

      click_link "Sort Alphabetically"

      expect(@bear_lake.name).to appear_before(@dream_lake.name)
    end

    it "i see a form that allows me to input a number value and filter by greater than" do
      expect(page).to have_content("Find trails by elevation greater than:")

      fill_in "Find trails by elevation greater than:", with: "100"

      click_on "Search"
      expect(current_path).to eq("/offices/#{@rmnp_office.id}/trails")

      expect(page).to have_content(@dream_lake.name)
      expect(page).to_not have_content(@bear_lake.name)
    end
  end
end
