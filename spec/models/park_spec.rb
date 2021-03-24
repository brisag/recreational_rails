require 'rails_helper'

describe Park, type: :model do
  describe 'relationships' do
    it { should have_many :programs }
  end
end
