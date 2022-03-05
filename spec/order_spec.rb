require 'order'

describe Order do
  let(:my_order) { Order.new }
  
  let(:meal_1) do
    meal_1 = double("meal_1", name: 'beans', price: 3)
  end

  let(:meal_2) do
    meal_2 = double("meal_2", name: 'sausages', price: 5)
  end

  it 'initiates with an empty order array' do
    expect(my_order.order).to eq []
  end

  describe '#add_to_order' do
    it 'adds a meal to the order' do
      my_order.add_to_order(meal_1)
      expect(my_order.order).to include(meal_1)
    end
  end

  describe "#see_order" do
    it 'shows meals and prices of my order and a total price' do
      my_order.add_to_order(meal_1)
      my_order.add_to_order(meal_2)
      expect { my_order.see_order }.to output("beans: 3\nsausages: 5\ntotal: 8\n").to_stdout
    end
  end
end