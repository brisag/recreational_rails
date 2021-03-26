require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Parks show page" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
      @sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
      @crater_lake= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )

    end

    it "Then I see the park with that id including the its attributes" do
      visit "/parks/#{@grand_canyon.id}"

      # save_and_open_page

      expect(page).to have_content(@grand_canyon.name)
      expect(page).to have_content(@grand_canyon.capacity)
      expect(page).to have_content(@grand_canyon.permit_required)
      # expect(page).to have_content(@sand_dunes.name)
      # expect(page).to have_content(@sand_dunes.capacity)
      # expect(page).to have_content(@sand_dunes.permit_required)
      # expect(page).to have_content(@crater_lake.name)
      # expect(page).to have_content(@crater_lake.capacity)
      # expect(page).to have_content(@crater_lake.permit_required)
    end
    it "has a link to update Park" do
      visit "/parks/#{@grand_canyon.id}"
      expect(page).to have_link("Update Park")
      click_link "Update Park"
      expect(current_path).to eq("/parks/#{@grand_canyon.id}/edit")
    end
  end
end
