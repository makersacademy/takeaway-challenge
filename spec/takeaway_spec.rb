require 'takeaway'

describe Takeaway do

  menu = [
          {name: 'Bolognese', price: 6},
          {name: 'Pizza', price: 8},
          {name: 'Chips', price: 2},
          {name: 'Chicken', price: 3},
          {name: 'Hamburger', price: 4},
          {name: 'Donner Wrap', price: 6},
          {name: 'Nuggets', price: 3},
          {name: 'Mozzarella Sticks', price: 5},
          {name: 'Deep-fried Mars Bar', price: 1},
          {name: 'Fish', price: 5}
        ]

  describe '#menu' do
    it 'prints list of food items with prices' do
      expect(subject.menu).to eq menu
    end
  end

  describe "#choose" do
    it 'adds 3 pizza to order instance variable' do
      subject.parse_order('3 pizza')
      expect(subject.order).to include({name: 'Pizza', price: 8, quantity: 3})
    end
    it 'parses text correctly' do
      subject.parse_order('3 pizza, 4 burger, 2 nuggets')
      expect(subject.order).to eq([{total: 46}, {name: 'Pizza', price: 8, quantity: 3}, {name: 'Hamburger', price: 4, quantity: 4}, {name: 'Nuggets', price: 3, quantity: 2}])
    end
    it 'raises error when trying to choose non existent item' do
      expect{subject.parse_order('2 grapes')}.to raise_error 'Please choose something from the menu'
    end
  end

end