require 'spec_helper'
describe Checkout do
  subject(:checkout) { described_class.new }
  let(:fake_order) { double(:order, in_basket: ['Chicken Chow Mein']) }
  it 'responds to #total_cost' do
    expect(checkout).to respond_to(:total_cost).with(1).argument
  end

  describe '#total_cost' do
    it 'can calculate the total cost of an order' do
      allow(fake_order).to receive(:in_basket) {['Chicken Chow Mein', 'Spicy Chilli Beef']}
      expect(checkout.total_cost(fake_order)).to eq(10.50)
    end
  end

  describe '#itemised_receipt' do
    it 'can show an itemised list of items ordered, their cost, and the total' do
      receipt_message = "Order:\n1.Chicken Chow Mein - £5.5\nTotal - £5.5"
      expect(checkout.itemised_receipt(fake_order)).to eq(receipt_message)
    end
  end
end
