require 'order'

describe Order do
  let(:menu) { double :menu, items: { "Blini" => 7 }, print_menu: "Blini, £7" }
  subject(:order) { Order.new(menu) }
  describe '#initialize' do
    it 'the basket is empty by default' do
      expect(order.basket).to be_empty
    end

    it 'total should be 0 by default' do
      expect(order.total).to eq 0
    end
  end

  describe '#show_menu' do
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

    it 'should add the item price to total' do
      order.add_item("Blini")
      expect(order.total).to eq(menu.items["Blini"])
    end
  end

  describe '#show_order' do
    it 'shows the order' do
      order.add_item("Blini")
      expect { order.show_order }.to output.to_stdout
    end
  end
end
