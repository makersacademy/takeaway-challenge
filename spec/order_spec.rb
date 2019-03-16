require 'order'

describe Order do
  subject(:order) { Order.new }
  let(:dish) { double :dish}

  it 'should initalize an order with the @orderlines attribute set to nil' do
    expect(order.orderlines).to eq nil
  end
  it 'should initalize an order with the @total attribute set to 0' do
    expect(order.total).to eq 0
  end
  it 'should push an order to the orderlines attribute when create_order is called' do
    allow(dish).to receive(:price) { 7.5 }
    order.create_order([{ dish: dish, number: 2 }])
    expect(order.orderlines).to eq [{ dish: dish, number: 2 }]
  end
  it 'should set @total attribute by calling private calculate_total method when create_order is called' do
    allow(dish).to receive(:price) { 7.5 }
    order.create_order([{ dish: dish, number: 3 }])
    expect(order.total).to eq 22.5
  end
end
