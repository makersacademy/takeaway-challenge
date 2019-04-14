require 'takeaway'

RSpec.describe Takeaway do

  let(:menu) { Menu.new }
  let(:item) { 'Lamb Nihari' }

  describe '#menu' do
    it 'prints out the menu of the takeaway' do
      expect {subject.menu}.to output.to_stdout
    end
  end

  describe '#price' do
    it 'returns price of an item in the options hash' do
    expect(item.price).to eq 8.00
    end
  end

  describe '#place_order' do
    it 'raises error when item is not recognised' do
      choice = "Lobster"
      expect {subject.place_order(choice)}.to raise_error "Sorry we don't have that, check our menu"
    end
  end

    context 'when an order is placed' do
      it 'puts the order into the basket' do
        subject.place_order(item)
        expect(subject.basket).to include(item)
      end

      it 'calculates the price values of each item' do
        subject.place_order(item)
        expect(subject.total).to eq subject.basket
      end
    end
end
