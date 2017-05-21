require 'spec_helper'
describe Checkout do
  subject(:checkout) { described_class.new }
  let(:order) { double(:order) }
  it 'responds to #total_cost' do
    expect(checkout).to respond_to(:total_cost).with(1).argument
  end

  describe '#total_cost' do
    it 'can calculate the total cost of an order' do
      allow(order).to receive(:current_order) {['Chicken Chow Mein', 'Spicy Chilli Beef']}
      expect(checkout.total_cost(order)).to eq(10.50)
    end
  end
end
