require 'order'

describe Order do

subject(:order) {described_class.new}
let(:menu) {double :menu}


  describe '#select_dishes' do
    it 'selects dishes from the list' do
      allow(menu).to receive(:display_dishes)
      menu.display_dishes
      expect(order).to respond_to(:select_dishes).with(3).arguments
    end

    it 'adds dishes to selected dishes' do
      order.select_dishes("chips",2, 3)
      expect(order.selected_dishes).to include("chips"=>3)
    end
  end

  describe '#total_price' do

    it 'displays the total price of an order' do
      order.select_dishes("chips",2, 4)
      expect(order.total).to eq 8
    end
  end
end
