require 'order'

describe Order do

  it "is an order" do
    expect(subject).to be_kind_of Order
  end

  it "stores an order" do
    expect(subject).to respond_to(:input_order).with(2).arguments
  end
end
