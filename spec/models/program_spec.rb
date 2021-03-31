require 'rails_helper'

describe Program, type: :model do
  before :each do
    @grand_canyon = Park.create!(name: 'GRCA Park', capacity: 30, permit_required: false )
    @fishing = @grand_canyon.programs.create!(name: 'Grand Fishing Online', num_of_participants: 100, virtual: true)
    @rafting = @grand_canyon.programs.create!(name: 'Raft the Waves', num_of_participants: 8, virtual: false)
    @hiking = @grand_canyon.programs.create!(name: 'Grand Descent', num_of_participants: 30, virtual: false)
  end

  describe 'relationships' do
    it { should belong_to :park }
  end

  describe 'validations' do
    it {should validate_presence_of :name}
    it {should validate_presence_of :num_of_participants}
  end

  describe 'class methods' do
    describe '::true_virtual_records' do
      it 'only shows program if true_virtual_records is true' do
        expect(Program.true_virtual_records.to_a).to eq([@fishing])
      end
    end
  end
end
