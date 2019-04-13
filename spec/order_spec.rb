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
      subject.confirm_order
      expect(subject.confirm_order?).to be true
    end
    it 'shows list of pizzas ordered' do
      subject.add_selected_pizza(pizza)
      expect(subject.display_pizzas).to include pizza
    end
  end
end
