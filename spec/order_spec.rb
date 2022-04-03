require 'order'

describe Order do

  let(:order) { Order.new }

  it 'can create an array' do
    expect(order.contents).to eq []
  end

  it 'can add menu items to the array' do
    dish = double :dish, name: "Fish and Chips", price: "£5.00"
    amount = 2
    order.add(dish, amount)
    expect(order.contents).to eq [{name: "Fish and Chips", price: "£5.00", amount: 2}]
  end

  it 'can list current items ordered so far' do
    dish1 = double :dish, name: "Fish and Chips", price: "£5.00"
    dish2 = double :dish, name: "Hot Dog", price: "£2.50"
    amount1 = 2
    amount2 = 2
    order.add(dish1, amount1)
    order.add(dish2, amount2)
    expect(order.list).to eq "1. 2x Fish and Chips @ £5.00 each\n2. 2x Hot Dog @ £2.50 each\n"
  end

  it 'can calculate the sum of the order' do
    dish1 = double :dish, name: "Fish and Chips", price: "£5.00"
    dish2 = double :dish, name: "Hot Dog", price: "£2.50"
    amount1 = 2
    amount2 = 2
    order.add(dish1, amount1)
    order.add(dish2, amount2)
    order.add_to_cost_array
    expect(order.sum).to eq "£15.00"
  end
end