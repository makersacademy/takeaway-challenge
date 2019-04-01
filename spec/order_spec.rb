require 'order'

describe Order do
  it 'stores orders in hash' do
    subject.order_into_hash(1, 1)
    expect(subject.show_orders).to include "Burger x 1"
  end

  it 'shows all orders' do
    subject.order_into_hash(1, 1)
    subject.order_into_hash(3, 1)
    subject.order_into_hash(5, 1)
    expect(subject.show_orders).to include "Chips x 1"
  end

  it 'takes orders' do
    subject.order_into_hash(1, "1")
    expect(subject.orders).to eq [{ food: 1, quantity: "1" }]
  end
end
