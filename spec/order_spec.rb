require 'order'

describe Order do

  let(:order) { order = Order.new        }
  let(:dish1) { double :dish, :price => 5}
  let(:dish2) { double :dish, :price => 5}
  let(:dish3) { double :dish, :price => 5}

  it 'should start with no dishes' do
    expect(order.dishes).to eq []
  end

  it 'should start with no total value' do
    expect(order.total).to eq 0
  end

  it 'should be able to add dishes' do
    order.add(dish1)
    expect(order.dishes).to eq [dish1]
  end

  it 'should give a total value' do
    order.add(dish1)
    order.add(dish2)
    order.add(dish3)
    order.sum
    expect(order.total).to eq 15
  end

end