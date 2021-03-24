require 'rails_helper'

describe Office, type: :model do
  describe 'relationships' do
    it { should have_many :trails }
  end

  describe 'class methods' do
    describe '::order_created_at' do
      it 'will list records in order of created_at' do
        rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
        moab_office = Office.create!(name: 'Alamosa Office', capacity: 50, first_aid: false )
        zion_office = Office.create!(name: 'Zion Office', capacity: 250, first_aid: true )

        expected = [zion_office, moab_office, rmnp_office]
        expect(Office.order_created_at).to eq(expected)
      end
    end
  end
end
