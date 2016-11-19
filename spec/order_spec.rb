require "./lib/order"

describe Order do
  subject(:order) {described_class.new}

  before do
    order.select_items("burrito", 2)
  end

  it "should allow a customer to order a number of items" do
    expect(order.selection).to eq({ :burrito => 2 })
  end


  it "should add the selection to the order" do
    expect(order.shopping_cart).to eq ([{ :burrito => 2 }])
  end

  it "should get the price of each item in the order" do
    expect{order.get_price}.to output.to_stdout
  end

  it "should keep track of the prices" do
    order.get_price
    expect(order.prices).to eq([12])
  end

  it "should sum the totals of the orders" do
    order.get_price
    order.total_price
    expect(order.total).to eq 12
  end


end
