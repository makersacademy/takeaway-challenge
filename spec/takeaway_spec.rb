require 'takeaway'
require 'order'

describe Takeaway do 
  context ' user wants to order something' do
    it 'creates list of pizzas with prices' do
      pizza = double(:name => "pizza", :price => 9)
      allow(subject).to receive(:pizzas).and_return([pizza])
      expect(subject.pizzas).to include pizza
    end
  end

  context 'allows an order to be created' do 
    it 'creates a order list' do
      expect(subject.create_order).to be_a Order
    end 

    it 'add pizza to create order' do
      order = Order.new 
      pizza = double(:name => "pizza", :price => 9)
      allow(order).to receive(:pizzas) { [pizza] }
      expect(order.pizzas).to include pizza
    end 
    it 'can confirm order' do
      subject.create_order
      subject.confirm_order
      expect(subject.order.confirm_order?).to eq true
    end
    it 'should show the pizzas on the order' do
      order = Order.new 
      pizza = double(:name => "pizza", :price => 9)
      allow(order).to receive(:pizzas).and_return([pizza])
      allow(order).to receive(:display_items)
      expect(order.pizzas).to include pizza
    end
  end 
end 