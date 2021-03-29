require 'rails_helper'

RSpec.describe 'As a Visitor', type: :feature do
  describe 'when I visit the Park Index page' do
    describe 'next to every park, I see a link to delete that park' do
      it 'can delete an park when I click on a link' do
        @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )

        visit '/parks'

        # save_and_open_page
        click_link 'Delete Park'

        expect(current_path).to eq('/parks')
        expect(page).to_not have_content(@grand_canyon.name)
      end
    end
  end
end
