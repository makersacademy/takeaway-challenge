require 'order'

describe Order do

  let(:order) { Order.new }
  let(:dish) { double :dish}

  it 'has a basket which dishes can be added to' do
    dish = double(dish)
    order.add_dish(dish, 4)
    expect(order.basket.count).to eq 1
  end

  it 'can calculate the total cost of order' do
    dish = double(dish, price: 4)
    order.add_dish(dish, 4)
    expect(order.total_cost).to eq 16
  end

end