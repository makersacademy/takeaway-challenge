require_relative '../lib/order'

describe Order do

  let(:basket_double) {
    double :basket,
    basket_contents: :contents_of_basket_double,
    basket_total: :total_of_basket_double
  }

  let(:order) { described_class.new(basket_double) }

  describe '#initalize' do
    it 'initializes with contents of a basket as ordered items' do
      expect(order.ordered).to eq :contents_of_basket_double
    end
  end

  describe '#confirm_by_text' do
    it 'sends a text to confirm the order' do

    end
  end
end
