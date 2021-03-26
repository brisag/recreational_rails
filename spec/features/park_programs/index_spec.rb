require 'rails_helper'

RSpec.describe "As a visitor" do
  describe "when I visit 'parks/:park_id/programs_table_name'" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false, created_at: "1918-04-13 14:45:55" )
      @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
      @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
    end

    it "I see each program that is associated with that park with each program's attributes." do
      visit "/parks/#{@grand_canyon.id}/programs"

      expect(page).to have_link("#{@grand_canyon.name}")

      expect(page).to have_content(@fishing.name)
      expect(page).to have_content(@fishing.num_of_participants)
      expect(page).to have_content(@fishing.virtual)

      expect(page).to have_content(@rafting.name)
      expect(page).to have_content(@rafting.num_of_participants)
      expect(page).to have_content(@rafting.virtual)
    end
  end 
end
