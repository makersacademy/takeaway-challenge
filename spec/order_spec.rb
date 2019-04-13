require 'order'

describe Order do

subject(:order) { described_class.new }

  context 'to select some number of available dishes' do
    it 'initialize with an empty array of dishes' do
      expect(order.select_dish).to eq []
    end

    it 'adds selected dishes to the select_dish empty array' do
      pizza = double(:name => "pizza", :price => 8)
      order.add_selected_dish(pizza)
      expect(order.select_dish).to include pizza
    end
  end

  context 'to check the total price matches the sum of dishe prices in the order' do
    it 'should return the total price of dishes selected' do
      pizza = double(:name => "pizza", :price => 8)
      order.add_selected_dish(pizza)
      expect(order.total_price).to eq 8
    end
  end
end
