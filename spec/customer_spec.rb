require 'customer.rb'
describe Customer do
  it 'gets created with a name, address and phone number' do
    name = "Sally"
    address = "1, First Line, Street, City, post code"
    phone_number = "+447540166527"
    customer = Customer.new(name, address, phone_number)
    expect(customer.name).to equal name
    expect(customer.address).to equal address
    expect(customer.phone_number).to equal phone_number
  end
end
