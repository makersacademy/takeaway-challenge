require 'customer'

describe Customer do
  let(:customer) {Customer.new("Joe Bloggs")}

  it 'has a name when initialized' do
    expect(customer.name).to eq 'Joe Bloggs'
  end
end
