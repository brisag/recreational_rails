 require 'rails_helper'

describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :programs }
  end

  describe 'class methods' do
    describe '::order_created_at' do
      it 'will list records in order of created_at' do
        grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
        sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
        crater_lake= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )

        expected = [crater_lake, sand_dunes, grand_canyon]
        expect(Park.order_created_at).to eq(expected)
      end
    end
  end
end
