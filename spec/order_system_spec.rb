require "order_system"

describe OrderSystem do
  subject(:order_system) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  before :each do
    allow(menu).to receive(:list).and_return({:"Chicken Curry" => 4.99, :Chips => 1.99})
    @item = order_system.menu.list.first[0]
    order_system.place_order(@item, 2)
  end

  describe "#place_order" do
    context "when give an item and quantity" do
      it "add the item to the order_list hash" do
        expect(order_system.order_list.first[0]).to be @item
      end

      it "multiplies the item price by the quantity" do
        price = order_system.menu.list.first[1]
        expect(order_system.order_list.first[1][1]).to eq(price * 2)
      end
    end
  end

  describe "#order_total" do
    context "when called" do
      it "returns a sum of all items in order_list" do
        total = 15.95
        item2 = order_system.menu.list.to_a.last[0]
        order_system.place_order(item2, 3)
        expect(order_system.order_total).to eq total
      end
    end
  end

end
