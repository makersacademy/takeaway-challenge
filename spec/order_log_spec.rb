require 'order_log'

describe OrderLog do
  let(:user) { double(:user)}
  let(:basket) { double(:basket) }
  let(:order) { double(:order) }
  let(:order_class) { double(:order_class, new: order)}
  let(:order_log) { OrderLog.new(order_class) }

  it 'orders should be empty after initialize' do
    expect(order_log.orders).to be_empty
  end

  it 'should include the order after add order' do
    allow(order).to receive(:confirm_order)
    allow(basket).to receive(:items)
    allow(basket).to receive(:clear)
    order_log.add(user, basket)
    expect(order_log.orders).to include(order)
  end
end