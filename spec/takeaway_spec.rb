require 'takeaway'

describe Takeaway do

      subject(:takeaway) {described_class.new(menu: menu, order: order)}
      let(:menu) {double :menu, print_menu: "sample menu"}
      let(:order) {double :order, total: 15}

      let(:display_menu) { {"beef wellington": 8, "venison": 8, "platter": 7} }
      let(:items) do {
          "venison": 8,
          "platter": 7 }
      end

  describe "#display_menu" do
      it 'displays the menu items and prices' do
        expect(takeaway.print_menu).to eq "sample menu"
      end
  end

  describe "#place_order" do
      it 'confirms the completed order' do
        expect(takeaway.place_order).to eq "sample menu"
      end

      it 'knows the quantity of items in the order' do
        expect(order).to receive(:add_item).twice
        takeaway.place_order(items)
      end

      it 'lets customers select items from the menu' do
        allow(menu).to receive(:has_item?).with("venison").and_return true
        expect(order.add_item("venison")).to eq "venison"
      end


  end

end
