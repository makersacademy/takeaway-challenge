require 'menu'

describe Menu do

  subject { described_class.new }

  describe '#contain?' do
    it 'should return false if a dish is not on the menu' do
      expect(subject.contain?("Carbonara")).to be false
    end

    it 'should return true if a dish is on the menu' do
      expect(subject.contain?("10 Hot Wings")).to be true
    end
  end

end
