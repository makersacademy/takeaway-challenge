require "./lib/order"

describe Order do
  subject(:order) {described_class.new}

  it "should allow a customer to order a number of items" do
    allow(order).to receive(:selection) { [4,3,2,1] }
    expect(order.selection).to eq([4, 3, 2, 1])
  end

end
