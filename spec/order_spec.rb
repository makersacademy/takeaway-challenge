require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:dish1) { "Olives" }
  let(:dish2) { "Hummus" }
  let(:qty) { 2 }

  before do
    order.add(dish1, qty)
    order.add(dish2, qty)
  end

  describe '#add' do
    it 'allows to order the selected dish specifing qty' do
      expect(order.review).to include(dish1, dish2)
    end
  end

  describe '#review' do
    it 'returns items, prices, total price in readable format' do
      expect(order.review).to start_with("Your order")
    end

    #Include a test for price calculation
  end

  describe '#place' do
    it 'places the order and send a confirmation text message' do
      allow(order).to receive(:send_text)
      expect(order.place).to eq "Order placed. You will get an SMS with the delivery time soon!"
    end
  end

end
