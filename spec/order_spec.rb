require './lib/order.rb'

describe Order do
  let(:dish_double) { double :dish, dish_cost: 5 }
  before :each do
    @order = Order.new
  end
  it 'can add a dish to the order' do
    @order.add(dish_double)
    expect(@order.contents).to include dish_double
  end

  it 'can remove a dish from the order' do
    @order.add(dish_double, 1)
    @order.add(dish_double, 1)
    @order.remove(dish_double)
    expect(@order.contents).to be_empty
  end

  it 'can return the total cost of the order' do
    @order.add(dish_double, 1)
    @order.add(dish_double, 1)
    expect(@order.cost).to eq 10
  end
end
