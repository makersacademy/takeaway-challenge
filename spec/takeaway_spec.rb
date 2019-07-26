require 'takeaway'

describe Takeaway do

  let(:pizza) { { name: :pizza, price: 8 } }
  let(:order) { { total_price: 0, select_pizza: [] } }
  subject(:takeaway) { described_class.new }

  context 'To check if User wants to order something' do
    it 'creates a menu of pizzas' do
      allow(takeaway).to receive(:select_pizza).and_return([pizza])
      expect(takeaway.select_pizza).to include pizza
    end
    it 'displays menu of selectable pizzas' do
      expect(takeaway.menu).to be_a Array
    end
  end

  context 'So User can order the pizza they want' do
    it 'allows User to create an order and confirm order' do
      takeaway.create_order(order)
      allow(order).to receive(:confirm_order)
      allow(takeaway).to receive(:place_order).with(:order)
      allow(order).to receive(:confirm_order?) { true }
      expect(takeaway.order.confirm_order?).to eq true
    end
    it 'should add a pizza to create order' do
      allow(order).to receive(:pizzas) { [pizza] }
      expect(order.pizzas).to include pizza
    end
    it 'should show the pizzas on the order' do
      allow(order).to receive(:pizzas).and_return([pizza])
      allow(order).to receive(:display_pizzas)
      expect(order.pizzas).to include pizza
    end
  end
end
