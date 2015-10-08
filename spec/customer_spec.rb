describe Customer do
  let(:customer) { Customer.new('Jongmin', '878-4323')}

  it 'has a name' do
    expect(customer.name).to eq('Jongmin')
  end

  it 'has a phone number' do
    expect(customer.phone_number).to eq('878-4323')
  end
end
