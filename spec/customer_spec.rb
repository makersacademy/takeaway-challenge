require 'customer'

describe Customer do

  it 'should have a name' do
    customer = Customer.new
    expect(customer.name).to eq 'Kev'
  end

end