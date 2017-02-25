require 'customer'
describe Customer do
subject(:customer){described_class.new(:name, :address, :ph)}


  it 'validates the name' do
    expect(customer.name).to eq :name
  end
  it 'validates the address' do
    expect(customer.address).to eq :address
  end
  it 'validates the phone no' do
    expect(customer.phone).to eq :ph
  end


end   # => Customer describe
