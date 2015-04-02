require 'customer'

describe Customer do
  let(:customer) { described_class.new "Bob", "555-1234" }

  it 'has a name' do
    expect(customer.name).to eq "Bob"
  end

  it 'has a number' do
    expect(customer.number).to eq "555-1234"
  end
end
