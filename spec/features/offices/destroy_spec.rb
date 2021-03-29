require 'rails_helper'

RSpec.describe 'As a Visitor', type: :feature do
  describe 'when I visit the Office Index page' do
    describe 'next to every office, I see a link to delete that office' do
      it 'can delete an office when I click on a link' do
        @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )

        visit '/offices'

        # save_and_open_page
        click_link 'Delete Office'

        expect(current_path).to eq('/offices')
        expect(page).to_not have_content(@rmnp_office.name)
      end
    end
  end
end
