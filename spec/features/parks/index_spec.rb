require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Parks index" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
      @sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
      @crater_lake= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )

      visit '/parks'
    end

    it "Then I see the names of each office record in the system" do
      # visit '/parks'

      # save_and_open_page

      expect(page).to have_content(@grand_canyon.name)
      expect(page).to have_content(@sand_dunes.name)
      expect(page).to have_content(@crater_lake.name)

    end

    it "has a link to create new Park" do
      # visit "/parks"
      expect(page).to have_link("New Park")
      click_link "New Park"
      expect(current_path).to eq("/parks/new")
    end

    it "Next to every park, I see a link to edit park " do
      within("#park-#{@sand_dunes.id}") do
        expect(page).to have_link("Update Park")
        click_link "Update Park"
        expect(current_path).to eq("/parks/#{@sand_dunes.id}/edit")
      end
    end
  end
end
