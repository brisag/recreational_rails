require 'rails_helper'

RSpec.describe 'As a Visitor', type: :feature do
  describe 'when I visit the Program Index page' do
    describe 'next to every program, I see a link to delete that program' do
      it 'can delete an program when I click on a link' do
        @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
        @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)

        visit '/programs'

        # save_and_open_page
        click_link 'Delete Program'

        expect(current_path).to eq('/programs')
        expect(page).to_not have_content(@fishing.name)
      end
    end
  end
end
