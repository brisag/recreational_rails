require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Office show page" do
    before :each do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
      @moab_office = Office.create!(name: 'Alamosa Office', capacity: 50, first_aid: false )
      visit "/offices/#{@rmnp_office.id}"
    end

    it "Then I see the office with that id including the its attributes" do

      expect(page).to have_content(@rmnp_office.name)
      expect(page).to have_content(@rmnp_office.capacity)
      expect(page).to have_content(@rmnp_office.first_aid)
    end

    it "has a link to update BackCountry Office" do
      expect(page).to have_link("Update BackCountry Office")
      click_link "Update BackCountry Office"
      expect(current_path).to eq("/offices/#{@rmnp_office.id}/edit")
    end

    it "has a link to Delete Office" do
      visit "/offices/#{@rmnp_office.id}"
      expect(page).to have_link("Delete Office")
      click_link "Delete Office"
      expect(current_path).to eq("/offices")
    end
  end
end
