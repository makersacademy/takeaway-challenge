require 'order'

describe Order do

  subject(:order_system) { described_class.new(Menu.new) }
  subject(:menu) { described_class.new(menu) }
  let(:menu) { double(:menu) }

 describe "#order" do
    context "when give an item and quantity" do
      before :each do
      allow(menu).to receive(:list).and_return({:pizza => 5.99 })
      @item = order_system.menu.list.first[0]
      order_system.place_order(@item, 2)
    end

      it "add the item to the order_list hash" do
      expect(order_system.order_list.first[0]).to be @item
    end

    it "multiplies the item price by the quantity" do
      price = order_system.menu.list.first[1]
      expect(order_system.order_list.first[1]).to eq(price * 2)
    end
  end
end
end
