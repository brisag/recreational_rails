require 'rails_helper'

describe Program, type: :model do
  describe 'relationships' do
    it { should belong_to :park }
  end
end
