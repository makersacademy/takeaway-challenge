require 'order'

describe Order do
  let(:order) { described_class.new }
  let(:order_item) { double :order_item }
  let(:order_item2) { double :order_item2 }
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
  it "calculates the order total" do
    allow(order_item).to receive(:cost).and_return(16)
    order.receive(order_item)
    expect(order.total).to eq 16
  end

  it "shows the order with each item, it's cost and a total" do
    # order_item.instance_variable_set("@dish_name", "Chicken Korma")
    # order_item.instance_variable_set("@quantity", 2)
    # order_item.instance_variable_set("@unit_cost", 8)
    # order_item.instance_variable_set("@cost", 16)
    order_item3 = OrderItem.new("1 2")
    order.receive(order_item3)
    order.total
    # allow(:order_item).to receive(:cost).and_return(16)
    # allow(:order_item2).to receive(:cost).and_return(9)
    expect { order.show }.to output("Chicken Korma 2 X £8 = £16\nTotal = £16\n").to_stdout
  end

end
