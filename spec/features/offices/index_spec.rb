require 'rails_helper'

RSpec.describe "As a visitor,", type: :feature do
  describe "When I visit the Office index" do
    before :each do
      @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
      @moab_office = Office.create!(name: 'Alamosa Office', capacity: 50, first_aid: false )
      @zion_office = Office.create!(name: 'Zion Office', capacity: 250, first_aid: true )

      @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)
      @dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: true)

      @delicate_arch = @moab_office.trails.create(name: 'Delicate Arch', elevation: 480, dogs_allowed: true)
      @park_avenue = @moab_office.trails.create(name: 'Park Avenue', elevation: 320, dogs_allowed: true)


      @weeping_rock = @zion_office.trails.create(name: 'Weeping Rock', elevation: 98, dogs_allowed: false)
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

    it "next to every office, I see a link to edit office" do
      visit "/offices"

      within("#office-#{@rmnp_office.id}") do
        expect(page).to have_link("Update Office")
        click_link "Update Office"
        expect(current_path).to eq("/offices/#{@rmnp_office.id}/edit")
      end
    end

    it "under each office I see the number of associated trails" do
      visit "/offices"

      expect(page).to have_content("Number of trails: #{@rmnp_office.count_trails}")
      expect(@rmnp_office.count_trails).to eq(2)
      expect(page).to have_content("Number of trails: #{@moab_office.count_trails}")
      expect(@moab_office.count_trails).to eq(2)
      expect(page).to have_content("Number of trails: #{@zion_office.count_trails}")
      expect(@zion_office.count_trails).to eq(1)
    end
  end
end
