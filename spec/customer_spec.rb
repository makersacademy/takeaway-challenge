require 'customer'

describe Customer do

  let(:customer) { Customer.new("Joe Bloggs") }

  it 'has a name when initialized' do
    expect(customer.name).to eq 'Joe Bloggs'
  end

  it 'can create an array' do
    expect(customer.contents).to eq []
  end

  it 'responds to basket method' do
    expect(customer).to respond_to(:basket)
  end

end
