require 'meal'

describe Meal do
  describe '.new' do 
    it 'creates a new object' do
      expect(described_class.new('curry', 10)).to be_a(Meal)
    end
  end
end
