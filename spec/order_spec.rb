require 'order'

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish, name: "fried chicken", price: 7.5, quantity: 2, total_price: 10.25 }
  let(:other_dish) { double :other_dish, name: "fresh salad", price: 2.75 }

  it { expect(order).to respond_to :add_dish }
  it { expect(order).to respond_to :finalize_order }
  it { expect(order).to respond_to :order_total }

  it 'allows to add dish to order list' do
    expect(order.add_dish(:dish, 2)).to eq 2
  end

  it 'allows to complete an order' do
    expect(order.finalize_order).to be_empty
  end

  it 'calculates the order total' do
    allow(:order).to receive(:order_total).and_return(12.5)
    order.add_dish(["chicken", 7.5])
    order.add_dish(["salad", 2.5], 2)
    expect(order.order_total).to eq 12.5
  end

end
