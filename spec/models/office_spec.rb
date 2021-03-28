require 'rails_helper'

describe Office, type: :model do
  before :each do
    @rmnp_office = Office.create!(name: 'RMNP Office', capacity: 200, first_aid: true )
    @moab_office = Office.create!(name: 'Alamosa Office', capacity: 50, first_aid: false )
    @zion_office = Office.create!(name: 'Zion Office', capacity: 250, first_aid: true )

    @dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: false)
    @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: false)
  end

  describe 'relationships' do
    it { should have_many :trails }
  end

  describe 'class methods' do
    describe '::order_created_at' do
      it 'will list records in order of created_at' do

        expected = [@zion_office, @moab_office, @rmnp_office]
        expect(Office.order_created_at).to eq(expected)
      end
    end
  end

  describe 'instance methods' do
    describe '#count_trails' do
      it 'will count trails for an office' do

        expect(@rmnp_office.count_trails).to eq(2)
      end 
    end

    describe '#order_abc' do
      it 'will list trails in order of name' do
        expected = [@bear_lake, @dream_lake]
        expect(@rmnp_office.order_abc).to eq(expected)
      end
    end
  end
end
