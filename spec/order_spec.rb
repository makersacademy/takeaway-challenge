require_relative '../lib/order'

describe Order do

  let(:basket_double) {
    double :basket,
    basket_contents: :contents_of_basket_double,
    basket_total: :total_of_basket_double
  }

  let(:confirmation_double) { double :confirmation, send_text: :text_sent_confirmation }
  let(:confirmation_class_double) { double :confirmation_class, new: confirmation_double }

  let(:order) { described_class.new(basket_double, confirmation_class_double) }

  describe '#initalize' do

    it 'initializes with contents of a basket as ordered items' do
      expect(order.ordered).to eq :contents_of_basket_double
    end

  end

  describe '#confirm_order' do

    it 'sends a text to confirm the order' do
      expect(order.confirm_order).to eq :text_sent_confirmation
    end

  end
  
end
