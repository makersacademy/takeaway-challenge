require 'order'

describe Order do
  subject(:order) { Order.new(order_calculations) }
  let(:dish) { double :dish }
  let(:order_calculations) { double :order_calculations }

  it 'should initalize an order with the @orderlines attribute set to nil' do
    expect(order.orderlines).to eq nil
  end
  it 'should initalize an order with the @total attribute set to 0' do
    expect(order.total).to eq 0
  end
  it 'should push an order to the orderlines attribute when create_order is called' do
    allow(dish).to receive(:price) { 7.5 }
    allow(order_calculations).to receive(:check_total)
    order.create_order([{ dish: dish, number: 2 }], 20)
    expect(order.orderlines).to eq [{ dish: dish, number: 2 }]
  end
  it 'should set @total attribute to second argument passed into create_order method' do
    allow(dish).to receive(:price) { 7.5 }
    allow(order_calculations).to receive(:check_total)
    order.create_order([{ dish: dish, number: 3 }], 20)
    expect(order.total).to eq 20
  end
  it 'should return order when create_order method is called with correct total' do
    allow(dish).to receive(:price) { 7.5 }
    allow(order_calculations).to receive(:check_total) { order }
    expect(order.create_order([{ dish: dish, number: 3 }], 20)).to eq order
  end
end
