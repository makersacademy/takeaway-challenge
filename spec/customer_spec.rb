require 'customer'

describe Customer do
  it "can create an order" do
    expect(subject.place_order).to be_an_instance_of(Order)
  end
end
