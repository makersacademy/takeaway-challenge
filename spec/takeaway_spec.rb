require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
  let (:menu) {double :menu, menu_items: [{:item => "Garlic Bread", :price => 5}]}
  let (:order) {double :order, order_items: []}
  let (:subject) {Takeaway.new(menu, order)}

  it { expect(described_class).to be < Menu }

  describe '#initialize' do
    it 'has pulled in the menu items' do
      expect(subject.menu_items).to eq menu.menu_items
    end

    it 'has a current order be an order instance' do
      expect(subject.current_order).to eq order
    end
  end

  describe '#add' do
    before(:each) do
      allow(order).to receive(:add).with("Garlic Bread", 2)
      allow(order).to receive(:order_items)
    end

    it 'adds items to the current_order' do
      expect(subject.current_order).to eq order
    end

    it 'does not raise error when a correct item is added' do
      expect{subject.add("Garlic Bread", 2)}.not_to raise_error
    end

    it 'raises error when incorrect item is added' do
      expect{subject.add("Goat", 1)}.to raise_error("Dish is not available")
    end
  end

  describe '#complete_order' do
    it 'raises error if order is empty' do
      allow(order).to receive(:order_items).and_return []
      expect{subject.complete_order}.to raise_error("You don't have any items in your basket")
    end
  end

  describe '#check_total' do
    it 'should return a summary of the total' do
      allow(order).to receive(:check_total).and_return 5
      allow(order).to receive(:current_total).and_return 5
      expect(subject.check_total).to eq "Your current order comes to £5"
    end
  end

end
