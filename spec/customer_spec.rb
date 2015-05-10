@tel_no = ENV['MY_MOBILE_NUMBER']

require 'customer'

describe Customer do

  it 'can create and retrieve details of a customer' do
    customer = Customer.new("Daniel", @tel_no)
    # Surely this doesn't count as too many expects?!?
    expect(customer.name).to eq("Daniel")
    expect(customer.mobile_number).to eq(@tel_no)
  end

end
