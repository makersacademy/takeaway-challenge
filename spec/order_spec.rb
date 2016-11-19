require "./lib/order"

describe Order do
  subject(:order) {described_class.new}

  it "should allow a customer to order a number of items" do
    order.select_items(1,2)
    expect(order.selection).to eq({ number: 1, quantity: 2 })
  end

it "should add the selection to the order" do
  order.select_items(1,2)
  order.add_selection_to_order
  expect(order.shopping_cart).to eq ([{ number: 1, quantity: 2 }])
end


end
