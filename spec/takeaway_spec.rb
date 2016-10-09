require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe "#show_menu" do
    context "when called" do
      it "calls menu.print" do
        expect(takeaway.menu).to receive(:print_menu)
        takeaway.show_menu
      end
    end
  end

  it { is_expected.to respond_to(:order).with(2).argument}

  describe "#order" do
    context "when give an item and quantity" do
      before :each do
        @item = takeaway.menu.list.first[0]
      end

      it "add the item to the order_list hash" do
        takeaway.order(@item, 2)
        expect(takeaway.order_list.first[0]).to be @item
      end

      it "multiplies the item price by the quantity" do
        price = takeaway.menu.list.first[1]
        takeaway.order(@item, 2)
        expect(takeaway.order_list.first[1]).to eq(price * 2)
      end
    end
  end

end
