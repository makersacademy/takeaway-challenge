require 'order'

describe Order do

  subject(:order){ described_class.new }

  it "Ensures the current order is empty to start with" do
    expect(order.current_order).to be_empty
  end

  it "Checks that the total order price is 0 to start with" do
    expect(order.total_price).to eq 0
  end

  it "Shows the order total" do
    order.add_item(1)
    order.add_item(2)
    expect(order.order_cost).to eq "Total price: 7"
  end

  it "Checks that fries have been added to the current_order" do
    order = Order.new
    order.add_item(2)
    expect(order.current_order).to eq [{:dish=>2, :name=>"burger", :price=>4}]
  end

end
