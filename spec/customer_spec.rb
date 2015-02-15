require 'customer'

describe Customer do

  let(:customer) { Customer.new('Kev', +447730613823) }

  it 'should have a contact name' do
    expect(customer.name).to eq 'Kev'
  end

  it 'should have a contact number' do
    expect(customer.number).to eq +447730613823
  end

end