require 'customer'

describe Customer do

  it 'has a phone number' do
    customer = Customer.new(+1234)
    expect(customer.number).to eq +1234
  end

end