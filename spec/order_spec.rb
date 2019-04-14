require 'order'

describe Order do

  subject(:order) { described_class.new }
  let(:pizza) { { name: :pizza, price: 8 } }

  context 'to select some number of available pizzas' do
    it 'initialize with an empty array of pizzas' do
      expect(order.select_pizza).to eq []
    end

    it 'adds selected pizza to the select_pizza empty array' do
      order.add_selected_pizza(pizza)
      expect(order.select_pizza).to include pizza
    end
  end

  context 'to check the total price' do
    it 'should return the total price of pizzas selected' do
      order.add_selected_pizza(pizza)
      expect(order.total_price).to eq 8
    end
  end

  context 'to confirm that the order has been placed successfully' do
    it 'should return true' do
      order.add_selected_pizza(pizza)
      order.confirm_order
      expect(order.confirm_order?).to be true
    end
    it 'shows list of pizzas ordered' do
      order.add_selected_pizza(pizza)
      expect(order.display_pizzas).to include pizza
    end
  end

  context 'To avoid order errors' do
    it 'prevents empty orders from being placed' do
      order.confirm_order
      expect(order.confirm_order?).to eq false
    end
    it 'once order is placed select_pizza array should be empty' do
      order.add_selected_pizza(pizza)
      order.confirm_order
      expect(order.select_pizza).to eq []
    end
    it 'total_price is reset after order is confirmed' do
      order.add_selected_pizza(pizza)
      order.confirm_order
      expect(order.total_price).to eq 0
    end
  end
end
