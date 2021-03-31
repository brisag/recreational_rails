require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit 'parks/:park_id/programs_table_name'" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false, created_at: "1918-04-13 14:45:55" )
      @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
      @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)

      visit "/parks/#{@grand_canyon.id}/programs"
    end

    it "I see each program that is associated with that park with each program's attributes." do

      expect(page).to have_link("#{@grand_canyon.name}")

      expect(page).to have_content(@fishing.name)
      expect(page).to have_content(@fishing.num_of_participants)
      expect(page).to have_content(@fishing.virtual)

      expect(page).to have_content(@rafting.name)
      expect(page).to have_content(@rafting.num_of_participants)
      expect(page).to have_content(@rafting.virtual)
    end


    it "Expect to see a link to create a new Program" do

      expect(page).to have_link("Create Program")

      click_link "Create Program"
      expect(current_path).to eq("/parks/#{@grand_canyon.id}/programs/new")
    end

    it "shows a link to sort programs in abc" do
      expect(page).to have_link("Sort Alphabetically")

      click_link "Sort Alphabetically"

      expect(@fishing.name).to appear_before(@rafting.name)

    end

    it "i see a form that allows me to input a number value and filter by greater than" do
      expect(page).to have_content("Find programs with Participants greater than:")

      fill_in "Find programs with Participants greater than:", with: "20"

      click_on "Search"

      expect(current_path).to eq("/parks/#{@grand_canyon.id}/programs")

      expect(page).to have_content(@fishing.name)
      expect(page).to_not have_content(@rafting.name)
    end
  end
end
