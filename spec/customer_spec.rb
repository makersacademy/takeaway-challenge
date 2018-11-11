require 'customer'

describe Customer do

  it 'can create a new customer' do
    person = Customer.new("Ajay")
    expect(person).to be_instance_of(Customer)
  end

  it 'can add a name when #initialize is called' do
    person = Customer.new("Ajay")
    expect(person.name).to eq "Ajay"
  end

  it 'can add an address' do
    person = Customer.new("Ajay")
    person.add_address("29, Buxton Road, CR0 2JZ")
    expect(person.address).to eq "29, Buxton Road, CR0 2JZ"
  end

  it 'can add a phone number' do
    person = Customer.new("Ajay")
    person.add_phone_number(7922231432)
    expect(person.number).to eq 7922231432
  end
  
end
