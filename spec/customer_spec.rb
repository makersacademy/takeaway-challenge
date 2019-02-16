require "customer"

describe Customer do
  it "We can make a customer with a special phone number." do
    Customer.new(1234)
  end
end
