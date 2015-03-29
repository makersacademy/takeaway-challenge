require 'restaurant'

describe Restaurant do
  let(:menu) { double :menu }
  let(:restaurant) { described_class.new menu }
  let(:order) { double :order }

  it 'has a menu' do
    expect(restaurant.menu).to eq menu
  end

  it 'can create a new order' do
    restaurant.open_new_order(order)
    expect(restaurant.pending_orders.include?(order)).to eq true
  end

  it 'can mark an order as ready' do # (Cooked, packaged)
    allow(order).to receive(:ready_for_delivery)
    allow(order).to receive(:ready).and_return(true)
    restaurant.order_ready(order)
  end

  it 'has the order under completed orders when ready' do
    allow(order).to receive(:ready_for_delivery)
    allow(order).to receive(:ready).and_return(true)
    restaurant.order_ready(order)
    expect(restaurant.completed_orders.include?(order)).to eq true
  end

  it 'no longer has the order under pending orders when ready' do
    allow(order).to receive(:ready_for_delivery)
    allow(order).to receive(:ready).and_return(true)
    restaurant.order_ready(order)
    expect(restaurant.pending_orders.include?(order)).to eq false
  end
end
