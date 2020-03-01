require 'takeaway'
require 'menu'
require 'order'

describe Takeaway do
  let (:menu) {double :menu, menu_items: {:item => "Garlic Bread", :price => 5}}
  let (:order) {double :order}
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
    it 'adds items to the current_order' do
      allow(order).to receive(:add).with("Garlic Bread", 2)
      allow(order).to receive(:order_items)
      expect(subject.current_order).to eq order
    end
    it 'puts the items added and the amounts to standard output' do
      @message = "You have added 2 Garlic Bread to your order\n"
      allow(order).to receive(:add).with("Garlic Bread", 2)
      expect{ subject.add("Garlic Bread", 2) }.to output(@message).to_stdout
    end
  end

end
