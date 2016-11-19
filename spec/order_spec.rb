require "./lib/order"

describe Order do
  subject(:order) {described_class.new}

  it "should allow a customer to order a number of items" do
    order.select_items(1,2)
    expect(order.selection).to eq({ number: 1, quantity: 2 })
  end

  # it "should allow the user to input an item" do
  #   allow(order).to receive(:item_selection) {1}
  #   expect { order.select_items }.to output("1").to_stdout
  # end


end
