require 'dish'

describe Dish do

  subject(:spaghetti) { described_class.new("spaghetti", 7.50) }
  subject(:no_arguments) { described_class.new }
  subject(:one_argument) { described_class.new("pizza") }

  describe '#initialize' do

    it 'raises an error if no arguments given' do
       expect{ no_arguments }.to raise_error ArgumentError
     end
     it 'raises an error if only one argument given' do
       expect{ one_argument }.to raise_error ArgumentError
     end

      it 'has a dish' do
        expect(spaghetti.dish).to eq "spaghetti"
      end
      it 'has a price' do
        expect(spaghetti.price).to eq 7.50
      end

  end

end
