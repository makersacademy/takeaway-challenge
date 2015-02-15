require 'customer'

describe Customer do
  it "has a phone number" do
    customer = Customer.new(7545215358)
    expect(customer.phone_number).to eq(7545215358)
  end
end