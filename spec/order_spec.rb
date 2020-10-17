require 'order'

describe Order do
  let(:item) { double :item }
  let(:menu) { double :menu, items: { "Blini" => 7 }, print_menu: "Blini, £7" }
  let(:basket) { double :basket, menu: menu, items: ["Blini"], show: "Blini, £7\nYour total is £7", add_item: "Blini" }
  subject(:order) { Order.new(basket) }

  describe '#show_order' do
    it 'gets the menu' do
      order.add_item("Blini")
      expect { order.show_order }.to output.to_stdout
    end
  end

  describe '#add_item' do
    it 'adds an item to basket' do
      expect(basket).to receive(:add_item) 
      order.add_item("Blini")
    end
  end

  describe '#show_menu' do
    it 'shows the order' do
      expect(menu).to receive(:print_menu)
      order.show_menu
    end
  end

  describe '#place_order' do
    it "raises error if basket is empty" do
      allow(basket).to receive(:empty?).and_return(true)
      expect { order.place_order }.to raise_error("Can't place an order with an empty basket!")
    end

    it "clears your basket" do
      order.add_item("Blini")
      allow(basket).to receive(:empty?).and_return(false)
      expect(basket).to receive(:clear)
      order.place_order
    end
  end
end
