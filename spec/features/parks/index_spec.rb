require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Parks index" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
      @sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
      @crater_lake= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )

    end

    it "Then I see the names of each office record in the system" do
      visit '/parks'

      # save_and_open_page

      expect(page).to have_content(@grand_canyon.name)
      expect(page).to have_content(@sand_dunes.name)
      expect(page).to have_content(@crater_lake.name)

    end
  end
end
