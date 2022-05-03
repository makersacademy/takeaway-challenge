require 'order'

describe Order do
  
  subject(:order) { Order.new }

  it "should create an instance of class Order" do
    expect(order).to be_instance_of(Order)
  end

end
