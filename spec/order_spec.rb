require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:order_item) { double "order_item" }
  let(:order_item2) { double "order_item2" }

  it "is initialized with an empty array" do
    expect(order.contents).to eq []
  end
  it "can receive and store 1 order item" do
    order.receive(order_item)
    expect(order.contents).to eq [order_item]
  end
  it "can receive and store 2 order items" do
    order.receive(order_item)
    order.receive(order_item2)
    expect(order.contents).to eq [order_item, order_item2]
  end
  it "stores the correct total" do
    allow(order_item).to receive(:dish_number).and_return("1")
    allow(order_item).to receive(:quantity).and_return("2")
    order.receive(order_item)
    expect(order.total).to eq 16
  end
end
