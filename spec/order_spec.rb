require 'simplecov'
SimpleCov.start
require 'order'

describe Order do

  let(:order)  { order = Order.new        }
  let(:dish_1) { double :dish, :price => 5}
  let(:dish_2) { double :dish, :price => 5}
  let(:dish_3) { double :dish, :price => 5}

  it 'should start with no dishes' do
    expect(order.dishes).to eq []
  end

  it 'should start with no total value' do
    expect(order.total).to eq 0
  end

  it 'should be able to add dishes' do
    order.add(dish_1)
    expect(order.dishes).to eq [dish_1]
  end

  it 'should give a total value' do
    order.add(dish_1)
    order.add(dish_2)
    order.add(dish_3)
    order.sum
    expect(order.total).to eq 15
  end

end