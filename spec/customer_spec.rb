require 'customer'

describe Customer do

  let (:customer) {Customer.new}

  it "can call the takeaway" do
    expect(customer).to respond_to(:call)
  end

end