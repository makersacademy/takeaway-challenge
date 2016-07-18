require 'order'

describe Order do
  before(:each) do
    @order = Order.new([:Chicken_Burger, :Chips])
  end
  it "totals up the price of the order" do
    expect(@order.total_up([:Chicken_Burger, :Chips])).to eq(5.5)
  end
  it "returns a confirmation message" do
    expect(@order.complete).to eq("Order complete! Your order of Chicken_Burger, Chips will arrive before #{Time.now + (60 * 60)}")
  end
end
