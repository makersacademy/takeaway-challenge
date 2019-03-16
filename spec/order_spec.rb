require 'order'

describe Order do

  let(:order) { Order.new }

  it 'can create an array' do
    expect(order.contents).to eq []
  end

  it { is_expected.to respond_to(:add).with(2).arguments }

  it 'can add to the array' do
    dish = double :dish, name: "Pepperoni", price: 6
    quantity = 2
    order.add(dish, quantity)
    expect(order.contents).to eq [{name: "Pepperoni", price: 6, quantity: 2}]
  end

end
