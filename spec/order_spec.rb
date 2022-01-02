require 'order'

describe Order do
  subject (:order) { Order.new }

  it 'is an order' do
    expect(order).to be_an Order
  end
end
