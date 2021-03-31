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

      expect(page).to have_content(@rmnp_office.name)
      expect(page).to have_content(@moab_office.name)
      expect(page).to have_content(@zion_office.name)
    end

    it "has a link to create new Office" do
      visit "/offices"
      expect(page).to have_link("New BackCountry Office")
      click_link "New BackCountry Office"
      expect(current_path).to eq("/offices/new")
    end

    it "Next to every park, I see a link to edit park " do
      visit "/offices"

      within("#office-#{@rmnp_office.id}") do
        expect(page).to have_link("Update Office")
        click_link "Update Office"
        expect(current_path).to eq("/offices/#{@rmnp_office.id}/edit")
      end
    end
  end
end
