require 'takeaway'

describe Takeaway do

      subject(:takeaway) {described_class.new(menu: menu, order: order)}
      let(:menu) {double :menu, print_menu: display_menu}
      let(:order) {double :order, total: 16}

      let(:display_menu) { {"venison pie": 8, "vegan platter": 7} }
      let(:items) { {beef: 8, lobster: 9} }

  describe "#display_menu" do
      it 'displays the menu items and prices' do
        expect(takeaway.print_menu).to eq display_menu
      end
  end

  describe "#completed_order" do
      it 'confirms the completed order' do
        expect(takeaway.completed_order).to eq total_price
      end

      it 'knows the quantity of items in the order' do
        expect(order).to receive(:add_item).twice
        takeaway.place_order(items)

      end
  end

end
