require 'order'

describe Order do

  let(:dish1) { double :dish, name: 'Pizza', price: 8 }
  let(:dish2) { double :dish, name: 'Cheeseburger', price: 6 }
  let(:dish3) { double :dish, name: 'Ribeye steak', price: 12 }
  let(:menu) { double :menu, available_dishes: [dish1, dish2] }
  subject(:order) { described_class.new(menu) }

  it 'initializes with no items' do
    expect(order.ordered_items).to be_empty 
  end

  describe '#add_item' do
    
    it 'adds a dish with default quantity of 1' do
      order.add_item(dish1)
      expect(order.ordered_items).to include({dish: dish1.name, price: dish1.price, quantity: 1})
    end

    it 'adds a dish with specified quantity' do
      order.add_item(dish2, 3)
      expect(order.ordered_items).to include({dish: dish2.name, price: dish2.price, quantity: 3})
    end

    it 'raises an error if item is not on a menu' do
      message = 'Item is not on a menu'
      expect{order.add_item(dish3, 1)}.to raise_error message
    end
  end

  describe '#not available?' do
    it 'checks if ordered dish is on a menu' do
      expect(order.not_available?(dish3)).to eq true
    end
  end
  
  describe '#show' do

    xit 'shows all the ordered items with quantities' do
      order.add_item(dish1)
      allow(dish1).to receive(:print_dish)
      order.add_item(dish2)
      allow(dish2).to receive(:print_dish)
      expect(order.show).to eq "Pizza (£8) - 1\nCheeseburger (£6) - 3\n"
    end
  end

  describe '#calc_total' do

    it 'calculate total price of the order' do
      order.add_item(dish1)
      order.add_item(dish2)
      expect(order.calc_total).to eq 14
    end

  end

end