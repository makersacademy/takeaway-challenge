require 'takeaway'
require 'order'

describe Takeaway do
  context 'To check if User wants to order something' do
    it 'creates a list of pizzas with prices' do
      pizza = double('pizza', :name => 'pizza', :price => 8)
      allow(subject).to receive(:pizzas).and_return([pizza])
      expect(subject.pizzas).to include pizza
    end
  end

  context 'So User can order the pizza they want' do
    it 'allows User to create an order list' do
      expect(subject.create_order).to be_a Order
    end

    it 'allows User to confirm order' do
      subject.create_order
      subject.confirm_order
      expect(subject.order.confirm_order?).to eq true
    end
  end
end
