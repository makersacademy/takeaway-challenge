require 'order'

describe Order do
  subject(:order) {described_class.new}
  let(:dish1) {double :dish, name: "Pad Thai", price: 5}
  let(:dish2) {double :dish, name: "Dumplings", price: 6}

  describe '#place_order' do
    it { is_expected.to respond_to(:place_order).with(100).arguments }
    end
    it 'will add dishes to the customer order array' do
      order.place_order(dish1, dish2)
      expect(order.current_order).to include(dish1, dish2)
    end

  describe '#calculate_total' do
    context 'once a customer has placed an order' do
      it 'will add up the price of each dish' do
      order.place_order(dish1, dish2)
      expect(order.calculate_total).to eq 11
      end
    end
  end

end
