require 'takeaway'

describe Takeaway do
    describe '#add_to_basket' do
      it 'adds an item and price to the basket' do
        takeaway = Takeaway.new
        takeaway.add_to_basket('bibimbap')
        expect(takeaway.basket).to eq(['bibimbap, 10'])
      end
    end
end
