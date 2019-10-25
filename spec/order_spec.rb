require 'order'

describe Order do

    it "should create a new instance of order" do
        order = Order.new
    expect(order).to be_kind_of(Order)
    end
end