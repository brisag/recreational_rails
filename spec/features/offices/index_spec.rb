require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do
  describe "When I visit the Office index" do
    before :each do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
      @moab_office = Office.create!(name: 'Alamosa Office', capacity: 50, first_aid: false )
      @zion_office = Office.create!(name: 'Zion Office', capacity: 250, first_aid: true )

      @dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: true)
      @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: true)
      @delicate_arch = @moab_office.trails.create(name: 'Delicate Arch', elevation: 480, dogs_allowed: true)
      @park_avenue = @moab_office.trails.create(name: 'Park Avenue', elevation: 320, dogs_allowed: true)
      @double_arch = @moab_office.trails.create(name: 'Double Arch', elevation: 0, dogs_allowed: true)
      @weeping_rock = @zion_office.trails.create(name: 'Weeping Rock', elevation: 98, dogs_allowed: true)
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

    it 'Has a form to search All Parks' do
      visit '/offices'


      fill_in with: "RMNP Office"

      click_on "Search"

      expect(current_path).to eq("/offices")

      expect(page).to have_content(@rmnp_office.name)
      expect(page).to_not have_content(@zion_office.name)
    end

    it 'Has a form to partially search All Parks' do
      visit '/offices'


      fill_in with: "Zi"

      click_on "Search"

      expect(current_path).to eq("/offices")

      expect(page).to have_content(@zion_office.name)
      expect(page).to_not have_content(@rmnp_office.name)
    end

    it "has a link to sort by most trails to least trails" do
      visit '/offices'

      expect(page).to have_link("Sort by Offices with the most trails to least")

      click_link "Sort by Offices with the most trails to least"

      expect(current_path).to eq("/offices")
      expect(@moab_office.name).to appear_before(@zion_office.name)
    end
  end
end
