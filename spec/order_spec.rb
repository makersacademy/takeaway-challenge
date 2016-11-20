require 'order'

describe Order do

  subject(:order) {described_class.new}
  let (:menu) { double :menu}

  context "#ordering" do
    it 'order is initialized with an empty list for order items' do
      expect(order.order_items).to eq []
    end

    xit 'can read the items from the menu' do
      expect(order.read_menu).to eq menu.display
    end

    it 'can add items from the menu to the order' do

    end

  end
end
