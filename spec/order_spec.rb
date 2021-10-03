require 'order'

describe Order do
  let(:dish1) { double("Dish1", :name => "Burger", :price => 5) }
  let(:dish2) { double("Dish2", :name => "Chips", :price => 6) }
  let(:dish3) { double("Dish3", :name => "Chicken", :price => 7) }

  it "stores selected dishes" do
    order = Order.new([dish1, dish2])
    expect(order.basket).to eq([dish1, dish2])
  end

  it "shows the total of the items" do
    order = Order.new([dish1, dish3])
    expect(order.total).to eq(12)
  end
end