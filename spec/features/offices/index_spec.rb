require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do
  describe "When I visit the Office index" do
    before :each do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
      @moab_office = Office.create!(name: 'Alamosa Office', capacity: 50, first_aid: false )
      @zion_office = Office.create!(name: 'Zion Office', capacity: 250, first_aid: true )
    end

    it "Then I see the name of each office record in the system" do
      visit '/offices'

      # save_and_open_page

      expect(page).to have_content(@rmnp_office.name)
      expect(page).to have_content(@moab_office.name)
      expect(page).to have_content(@zion_office.name)
    end
  end
end
