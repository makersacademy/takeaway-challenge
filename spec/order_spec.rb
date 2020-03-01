require "order"

describe Order do
  let(:order) {Order.new}

  it "initializes with empty array" do
    expect(order.order).to be_empty
  end


end
