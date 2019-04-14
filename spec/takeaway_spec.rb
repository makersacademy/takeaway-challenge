require 'takeaway'

describe Takeaway do

  let(:pizza) { { name: :pizza, price: 8 } }
  let(:order) { { total_price: 0, select_pizza: [] } }
  subject(:takeaway) { described_class.new }


  context 'To check if User wants to order something' do
    it 'creates a menu of pizzas with prices' do
      allow(takeaway).to receive(:select_pizza).and_return([pizza])
      expect(takeaway.select_pizza).to include pizza
    end
  end

  context 'So User can order the pizza they want' do
    it 'allows User to create an order list' do
      expect(takeaway.create_order).to be_a Order
    end

    it 'allows User to confirm order' do
      takeaway.create_order
      takeaway.confirm_order
      expect(takeaway.order.confirm_order?).to eq true
    end
  end
end
