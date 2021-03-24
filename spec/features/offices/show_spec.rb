require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Office show page" do
    before :each do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
      @moab_office = Office.create!(name: 'Alamosa Office', capacity: 50, first_aid: false )
    end

    it "Then I see the office with that id including the its attributes" do
      visit "/offices/#{@rmnp_office.id}"

      # save_and_open_page

      expect(page).to have_content(@rmnp_office.name)
      expect(page).to have_content(@rmnp_office.capacity)
      expect(page).to have_content(@rmnp_office.first_aid)
    end
  end
end
