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

  describe '#list' do
    it 'should print out the list of dishes' do
      #expect(subject.list).to include "Lemon Chicken: £5"
      STDOUT.should_receive(:puts).with("Lemon Chicken: £5")
      subject.list
      end
  end


end
