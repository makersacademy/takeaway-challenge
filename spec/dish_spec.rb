require 'dish'

describe Dish do

  subject(:ramen) { described_class.new("Chilli Chicken Ramen", 7.50) }
  subject(:no_arguments) { described_class.new }
  subject(:one_argument) { described_class.new("Duck Gyoza") }

  describe '#initialize' do
    it 'raises an error if no arguments given' do
       expect{ no_arguments }.to raise_error ArgumentError
     end
     it 'raises an error if only one argument given' do
       expect{ one_argument }.to raise_error ArgumentError
     end
  end

  describe '#name' do
    it 'returns the name of the dish' do
      expect(ramen.name).to eq "Chilli Chicken Ramen"
    end
  end

  describe '#price' do
    it 'returns the price of a dish' do
      expect(ramen.price).to eq 7.50
    end
  end

end
