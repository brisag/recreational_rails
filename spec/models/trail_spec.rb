require 'rails_helper'

describe Trail, type: :model do
  before :each do
    @rmnp_office = Office.create(name: 'RMNP Office', capacity: 200, first_aid: true )
    @bear_lake = @rmnp_office.trails.create(name: 'Bear Lake Loop', elevation: 20, dogs_allowed: true)
    @dream_lake = @rmnp_office.trails.create(name: 'Dream Lake', elevation: 425, dogs_allowed: true)
    @flattop_mountain = @rmnp_office.trails.create(name: 'Flattop Mountain', elevation: 2849, dogs_allowed: false)
  end
  describe 'relationships' do
    it { should belong_to :office }
  end

  describe 'class methods' do
    describe '::true_dogs_allowed' do
      it 'only shows trail if dogs_allowed is true' do
        expect(Trail.true_dogs_allowed.to_a).to eq([@bear_lake, @dream_lake])
      end
    end
  end
end
