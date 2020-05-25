require 'takeaway'

describe Order do

  it "is an order" do
    expect(subject).to be_kind_of Order
  end

  it "access the order store" do
    expect(subject.cust_order).to eq []
  end

end
