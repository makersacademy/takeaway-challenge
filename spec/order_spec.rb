require "./lib/order"

describe Order do
  subject(:order) {described_class.new}

  it "should allow a customer to order a number of items" do
    order.select_items(1,2)
    expect(order.selection).to eq({ number: 1, quantity: 2 })
  end

  it "should output the customer's selection" do
    order.select_items(1,2)
    expect(order.output_selection).to eq "You have selected 2 order(s) of number 1"
  end

it "should add the selection to the order" do
  order.select_items(1,2)
  expect(order.shopping_cart).to eq ([{ number: 1, quantity: 2 }])
end


end
