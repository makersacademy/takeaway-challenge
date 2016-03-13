require 'counter'

describe Counter do

  let(:menu) { double :menu, show: nil }
  let(:order) { double :order }
  let(:order_class) {double :order, new: order }
  let(:dish) { double :dish }
  let(:price) { double :price  }
  subject(:counter) { described_class.new(menu, order_class) }

  describe '#show_menu' do
    it 'shows the menu' do
      expect(counter.show_menu).to eq menu.show
    end
  end
  describe '#add_dish' do
    it 'adds an item to the counter\'s menu (invalid test)' do
      allow(menu).to receive(:add_dish).with(dish, price)
      # expect(counter).to receive(:add_item(dish,price).and_return(price)
    end
  end
  describe '#remove_dish' do
    it 'remove an item from the counter\'s menu (invalid test)' do
      allow(menu).to receive(:remove_dish).with(dish, price)
      # expect(counter).to receive(:add_item(dish,price).and_return(price)
    end
  end
  describe '#new_order' do
    it 'opens a new order (invalid test)' do
      expect(counter.new_order).to be_a Order
    end
  end
  describe '#view_order' do
    it 'shows current order (invalid test)' do
      # counter.add_dish("hamburger", 7)
      # counter.new_order
      # allow(current_order).to receive(:add_item)
      # counter.add_item("hamburger", 1)
      # expects(counter.show_order).to include hamburger: 7
    end
  end
  describe '#total' do
    it 'shows total of current order (invalid test)' do
      allow(menu).to receive(:add).with("hamburger",7)
      allow(order).to receive(:add_item).with("hamburger",2)
      allow(counter).to receive(:total)
      counter.new_order
      expect(counter.total).to eq 14
    end
  end
end
