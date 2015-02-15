require 'customer'

describe Customer do
  it 'should have nothing in their order to start with' do
    customer = Customer.new
    expect(customer.order).to eq []
  end
end