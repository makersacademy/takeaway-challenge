require 'customer'

describe Customer do 

  it 'has a phone number' do
    customer = Customer.new(+12345)
    expect(customer.phone_number).to eq +12345
  end

  
end