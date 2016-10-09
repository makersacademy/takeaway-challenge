require "order_system"

describe OrderSystem do
  subject(:order_system) { described_class.new(menu) }
  let(:menu) { double(:menu) }

  before :each do
    allow(menu).to receive(:list).and_return({:"Chicken Curry" => 4.99})
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

  describe "#show_order" do
    context "when called" do
      it "outputs a list of items in the order_list array" do
        expect(order_system.show_order).to eq order_system.order_list
      end
    end
  end

end
