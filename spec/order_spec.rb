require 'order'

describe Order do
  let(:menu) { double :menu, items: { "Blini" => 7 }, print_menu: "Blini, £7" }
  subject(:order) { Order.new(menu) }
  describe '#initialize' do
    it 'the basket is empty by default' do
      expect(order.basket).to be_empty
    end

    it 'gets the menu' do
      expect { order.show_menu }.to output.to_stdout
    end
  end

  describe '#add_item' do
    it 'adds an item to basket' do
      order.add_item("Blini")
      expect(order.basket).to include("Blini")
    end

    it 'raises error when trying to add item not in menu' do
      expect { order.add_item("Burger") }.to raise_error("This item doesn't exist!")
    end
  end
end
