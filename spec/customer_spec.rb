require 'customer'

describe Customer do

  it "Has nothing in the order when created" do
    customer = Customer.new
    expect(customer.order).to eq []
  end
end
