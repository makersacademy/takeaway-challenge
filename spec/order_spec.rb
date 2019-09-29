require 'order'

describe Order do

  let(:dish1) { { name: 'Pizza', price: 8 } }
  let(:dish2) { { name: 'Cheeseburger', price: 6 } }
  let(:dish3) { { name: 'Ribeye steak', price: 12 } }
  let(:menu) { double :menu, available_dishes: [dish1, dish2] }
  subject(:order) { described_class.new(menu) }

  it 'initializes with no items' do
    expect(order.ordered_items).to be_empty 
  end

  describe '#add_item' do
    
    it 'adds a dish with default quantity of 1' do
      order.add_item(dish1[:name])
      expect(order.ordered_items).to include({ name: dish1[:name], price: dish1[:price], quantity: 1 })
    end

    it 'adds a dish with specified quantity' do
      order.add_item(dish2[:name], 3)
      expect(order.ordered_items).to include({ name: dish2[:name], price: dish2[:price], quantity: 3 })
    end

    it 'raises an error if item is not on a menu' do
      message = 'Item is not on a menu'
      expect { order.add_item(dish3, 2) }.to raise_error message
    end
  end

  describe '#not available?' do
    it 'checks if ordered dish is on a menu' do
      expect(order.not_available?(dish3)).to eq true
    end
  end
  
  describe '#show' do

    it 'shows the order' do
      expect(order).to respond_to(:print_order)
    end
  end

  describe '#calc_total' do

    it 'calculate total price of the order' do
      order.add_item(dish1[:name])
      order.add_item(dish2[:name], 3)
      expect(order.calc_total).to eq 26
    end
  end
end
