require "order"

describe Order do
  it "can make a new instance of order" do
    expect(Order.new).to be_an_instance_of(Order)
  end
end