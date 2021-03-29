require 'rails_helper'

RSpec.describe 'As a Visitor', type: :feature do
  describe 'when I visit the Trail Index page' do
    describe 'next to every trail, I see a link to delete that trail' do
      it 'can delete an trail when I click on a link' do
        @rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true )
        @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: true)
        # @flattop_mountain = @rmnp_office.trails.create(name: 'Flattop Mountain', elevation: 2849, dogs_allowed: true)


        visit '/trails'

        # save_and_open_page
        click_link 'Delete Trail'

        expect(current_path).to eq('/trails')
        expect(page).to_not have_content(@bear_lake.name)
      end
    end
  end
end
