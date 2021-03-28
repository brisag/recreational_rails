require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Programs index" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
      @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
      @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
      @hiking = @grand_canyon.programs.create!(name: 'Grand Descent', num_of_participants: 30, virtual: false)
    end

    it "Then I see each program in the system including its attributes" do
      visit '/programs'

      # save_and_open_page

      expect(page).to have_content("All Programs")
      within('#activity') do
        expect(page).to have_content(@fishing.name)
        expect(page).to have_content(@fishing.num_of_participants)
        expect(page).to have_content(@fishing.virtual)
      end

      within('#activity') do
        expect(page).to_not have_content(@rafting.name)
        expect(page).to_not have_content(@rafting.num_of_participants)
        expect(page).to_not have_content(@rafting.virtual)
      end

      within('#activity') do
        expect(page).to_not have_content(@hiking.name)
        expect(page).to_not have_content(@hiking.num_of_participants)
        expect(page).to_not have_content(@hiking.virtual)
      end
    end
  end
end
