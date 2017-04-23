require 'order'

describe Order do

  subject(:order) { described_class.new(Menu.new) }
  subject(:menu) { described_class.new(menu) }
  let(:menu) { double(:menu) }

 describe "#order" do
    context "when give an item and quantity" do
      before :each do
      allow(menu).to receive(:list).and_return({:pizza => 4.99 ,:chips => 1.99})
      @item = order.menu.list.first[0]
      order.place_order(@item, 2)
    end

      it "add the item to the order_list hash" do
      expect(order.order_list.first[0]).to be @item
    end

    it "multiplies the item price by the quantity" do
      price = order.menu.list.first[1]
      expect(order.order_list.first[1]).to eq(price * 2)
    end
  end
end
  describe '#show_total_order' do
    context "Shows the order" do
      it 'outputs items list in the order_list' do
        expect(order.show_order).to eq order.order_list
      end

      it 'returns sum of all items from the order list' do
        total = 15.95
        item2 = order.menu.list.to_a.last[0]
        order.place_order(item2, 3)
        expect(order.total_order).to eq total
      end
    end
  end
end
