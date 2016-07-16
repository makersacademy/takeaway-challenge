require 'customer'

describe Customer do
  subject(:customer) { described_class.new("Jason", "50 Commercial St, London E1 6LT", "07522253914") }

  it 'knows its name' do
    expect(customer.name).to eq("Jason")
  end

  it 'knows its address' do
    expect(customer.address).to eq("50 Commercial St, London E1 6LT")
  end

  it 'knows its telephone' do
    expect(customer.phone).to eq("07522253914")
  end
end
