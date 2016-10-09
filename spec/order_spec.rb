require 'order'

describe Order do

  order = Order.new

  it "Ensures the current order is at the start" do
    expect(order.current_order).to eq []
  end

end
