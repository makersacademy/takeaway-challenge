require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:order_item) { double "order_item" }
  it "is initialized with an empty array" do
    expect(order.contents).to eq []
  end
  it "can receive 1 order item" do
    order.receive(order_item)
    expect(order.contents).to eq [order_item]
  end
  
end
