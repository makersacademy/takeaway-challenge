require 'resturant'

describe Resturant do
  it "init method returns instance of order.new" do
    expect(Resturant.new).to eq Resturant.new(Order.new)
  end
end
