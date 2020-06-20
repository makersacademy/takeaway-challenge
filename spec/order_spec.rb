require 'order'

describe Order do
  let(:order) { Order.new }
  list =
  { 
    "Vegetable Ramen" => 5,
    "Crispy Tofu" => 4
  }
  
  describe '#show_list' do

    it 'displays all of the dishes and their prices' do
      expect(order.show_list).to eq(list)
    end

  end

  describe '#add(dish)' do

    it 'adds the selected dish to the customer order' do
      order.add("Vegetable Ramen")
      expect(order.customer_order).to include("Vegetable Ramen")
    end

  end

end