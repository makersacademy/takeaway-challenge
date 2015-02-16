require 'order'

describe Order do

  let(:order ) { Order.new }
  let(:dish) {double :dish, price: 2}

  it 'has a basket to hold the order' do
    expect(order.basket).to eq ({})
  end

  it 'can add dishes to the basket' do
    order.add_item_to_basket(dish, 2)
  end

  it 'can calculate the total price' do
    order.add_item_to_basket(dish, 2)
    expect(order.total_price).to eq 4
  end
end