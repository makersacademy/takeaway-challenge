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
  expect(order.get_price).to eq("2 x burrito at £6 = £12")
end


end
