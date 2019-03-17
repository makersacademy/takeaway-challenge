require "order"

describe Order do

  it "creates an instance of order class" do
    order = Order.new
    expect(order).to be_a(Order)
  end

  it "receives separate single dish objects as instance variables" do
    order = Order.new
    dish1 = double
    dish2 = double
    allow(dish1).to receive(:name) { "ejemplo" }
    allow(dish2).to receive(:name) { "example" }
    allow(dish1).to receive(:price) { 4.99 }
    allow(dish2).to receive(:price) { 5.25 }
    order.add_to_order(dish1, 1)
    order.add_to_order(dish2, 1)
    expect(order.items).to eq([{ dish1.name => dish1.price }, { dish2.name => dish2.price }])
  end

  it "receives multiple equal dish objects as instance variables" do
    order = Order.new
    dish3 = double
    allow(dish3).to receive(:price) { 7.50 }
    allow(dish3).to receive(:name) { "repeated" }
    order.add_to_order(dish3, 3)
    expect(order.items).to eq([{ dish3.name => dish3.price }, { dish3.name => dish3.price }, { dish3.name => dish3.price }])
  end

  it "calculates correct total multiple orders of same product" do
    order = Order.new
    dish3 = double
    allow(dish3).to receive(:price) { 7.50 }
    allow(dish3).to receive(:quantity) { 3 }
    allow(dish3).to receive(:name)
    order.add_to_order(dish3, 3)
    expect(order.give_total).to eq(3 * 7.50)
  end
end
