require 'order'

describe Order do

  it "responds to cust_order" do
    expect(subject).to respond_to :cust_order
  end

  it "stores the customer orders in an array" do
    expect(subject.cust_order).to eq []
  end

end
