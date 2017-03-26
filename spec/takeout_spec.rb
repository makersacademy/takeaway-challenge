require 'takeout'


describe Takeout do

subject(:takeout) { described_class.new }

  describe '#menu' do
    it 'returns an array containing dishes and prices' do
      expect(takeout.menu).to include ({dish: "Cold chicken", price: " 1.50"})
    end
  end





end
