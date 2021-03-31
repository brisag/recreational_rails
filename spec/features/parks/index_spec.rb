require 'rails_helper'

RSpec.describe "As a visitor", type: :feature do
  describe "When I visit the Parks index" do
    before :each do
      @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
      @sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
      @crater_lake= Park.create!(name: 'Crater Lake', capacity: 25, permit_required: false )

      @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
      @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
      @hiking = @grand_canyon.programs.create!(name: 'Grand Descent', num_of_participants: 30, virtual: false)

      @sand_boarding = @sand_dunes.programs.create!(name: 'Sandboard', num_of_participants: 6, virtual: false)
      @hot_springs = @sand_dunes.programs.create!(name: 'Hot Spring Nights', num_of_participants: 12, virtual: false)

      @conspiracies = @crater_lake.programs.create!(name: 'What Crater?', num_of_participants: 6, virtual: false)
      visit '/parks'
    end

    it "Then I see the names of each office record in the system" do
      expect(page).to have_content(@grand_canyon.name)
      expect(page).to have_content(@sand_dunes.name)
      expect(page).to have_content(@crater_lake.name)

    end

    it "has a link to create new Park" do
      expect(page).to have_link("New Park")
      click_link "New Park"
      expect(current_path).to eq("/parks/new")
    end

    it "Next to every park, I see a link to edit park " do
      within("#park-#{@sand_dunes.id}") do
        expect(page).to have_link("Update Park")
        click_link "Update Park"
        expect(current_path).to eq("/parks/#{@sand_dunes.id}/edit")
      end
    end

    it "under each park I see the number of associated programs" do
      expect(page).to have_content("Number of programs offered: #{@grand_canyon.count_programs}")
      expect(@grand_canyon.count_programs).to eq(3)
      expect(page).to have_content("Number of programs offered: #{@sand_dunes.count_programs}")
      expect(@sand_dunes.count_programs).to eq(2)
      expect(page).to have_content("Number of programs offered: #{@crater_lake.count_programs}")
      expect(@crater_lake.count_programs).to eq(1)
    end
  end
end
