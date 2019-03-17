require 'order'

describe Order do
  subject(:order) { Order.new(menu, order_calculations) }
  let(:dish) { double :dish }
  let(:order_calculations) { double :order_calculations }
  let(:menu) { double :menu }

  it 'should initalize an order with the @orderlines attribute set to an empty array' do
    expect(order.orderlines).to eq []
  end
  it 'should initalize an order with the @total attribute set to 0' do
    expect(order.total).to eq 0
  end
  it 'should push an order to the orderlines attribute when add method is called' do
    allow(order_calculations).to receive(:calculate_total)
    allow(menu).to receive(:find_dish) { dish }
    order.add("Pizza", 2)
    expect(order.orderlines).to eq [{ dish: dish, quantity: 2 }]
  end
  it 'should set @total equal to calculated value of orderlines when add method is called' do
    allow(order_calculations).to receive(:calculate_total) { 15 }
    allow(menu).to receive(:find_dish) { dish }
    order.add("Pizza", 2)
    expect(order.total).to eq 15
  end
end
