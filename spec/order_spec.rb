require 'order'

describe Order do

  let(:dish) { double(:dish) }
  let(:menu) { double(:menu) }


  subject(:order) { described_class.new }

  describe '#initialize' do

    it '1. initializes with an empty "selections" array' do
      expect(order.selections).to be_an(Array)
    end
  end

  describe '#choose' do

    it '2. can add choices from menu to selections ' do
      order.choose(:beef, 1)
      expect(order.selections.last).to include(:beef, 11)
    end
  end

  describe '#sum_total' do

    it '3. Returns an integer as total price of selections' do
      order.choose(:fish, 1)
      order.choose(:rice, 2)
      expect(order.sum_total).to eq 25
    end
  end

  describe '#complete_order' do
    before do
    order.choose(:fish, 1)
    order.choose(:rice, 2)
    order.sum_total
    end
    it 'returns confirmation when payment is successful' do

      expect(order.complete_order(25)).to eq("Thanks for your order")
    end

    it 'returns an error if the correct amount is not paid' do
      expect{ order.complete_order(1) }.to raise_error "Payment error!"
    end

  end
end
