require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish1) { double :dish, name: 'Pizza', price: 8 }
  let(:dish2) { double :dish, name: 'Cheeseburger', price: 6 }

  it 'initializes with no items' do
    expect(order.ordered_items).to be_empty 
  end

  describe '#add_item' do
    
    it 'adds a dish with default quantity of 1' do
      order.add_item(dish1)
      expect(order.ordered_items).to include({dish: dish1, quantity: 1})
    end

    it 'adds a dish with specified quantity' do
      order.add_item(dish2, 3)
      expect(order.ordered_items).to include({dish: dish2, quantity: 3})
    end

  end

end