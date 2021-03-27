require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Program show page" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
      @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
      @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
      @hiking = @grand_canyon.programs.create!(name: 'Grand Descent', num_of_participants: 30, virtual: false)
    end

    it "Then I see the program with that id including the program's attributes" do
      visit "/programs/#{@fishing.id}"

      # save_and_open_page

      expect(page).to have_content("Program")
      # within('#activity') do
        expect(page).to have_content(@fishing.name)
        expect(page).to have_content(@fishing.num_of_participants)
        expect(page).to have_content(@fishing.virtual)
      # end
    end

    it "And I see a link to update that Program and it takes me to a form" do
      visit "/programs/#{@fishing.id}"
      expect(page).to have_link("Update Program")
      click_link "Update Program"
      expect(current_path).to eq("/programs/#{@fishing.id}/edit")
    end 
  end
end
