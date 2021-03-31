 require 'rails_helper'

describe Park, type: :model do
  before :each do
    @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
    @sand_dunes= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )
    @crater_lake= Park.create!(name: 'Sand Dunes', capacity: 25, permit_required: false )

    @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
    @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
    @hiking = @grand_canyon.programs.create!(name: 'Grand Descent', num_of_participants: 30, virtual: false)
  end
  describe 'relationships' do
    it { should have_many :programs }
  end

  describe 'validations' do
    it {should validate_presence_of(:name)}
    it {should validate_presence_of(:capacity)}
  end


  describe 'class methods' do
    describe '::order_created_at' do
      it 'will list records in order of created_at' do

        expected = [@crater_lake, @sand_dunes, @grand_canyon]
        expect(Park.order_created_at).to eq(expected)
      end
    end
  end

  describe 'instance methods' do
    describe '#count_programs' do
      it 'will count programs for an office' do
        expect(@grand_canyon.count_programs).to eq(3)
      end
    end

    describe '#participant_filter' do
      it "filters by number greater than" do

        expect(@grand_canyon.participant_filter(50).to_a).to eq([@fishing])
      end
    end

    describe '#order_programs_abc' do
      it 'will list programs in order of name' do
        expected = [@hiking, @fishing, @rafting]
        expect(@grand_canyon.abc_name).to eq(expected)
      end
    end
  end
end
