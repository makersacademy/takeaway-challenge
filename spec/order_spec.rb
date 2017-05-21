require 'order'

describe Order do
  subject(:order) { described_class.new }

  it 'adds a dish to the order' do
    order.add_to_order("Cheeseburger", 2)
    expect(order.selection).to eq [{ "Cheeseburger" => 2 }]
  end

  it 'calculates the price of the each item in order' do
    order.add_to_order("Cheeseburger", 2)
    expect(order.calculate_price).to eq [10]
  end

  it 'calculates the total cost of the order' do
    order.add_to_order("Cheeseburger", 1)
    order.add_to_order("BBQ Ranch Burger", 2)
    order.calculate_price
    expect(order.calculate_total).to eq 21
  end
end
