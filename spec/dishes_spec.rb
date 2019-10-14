require 'customer'
require 'dishes'

describe Dishes do

  it 'should display the dishes and prices to the customer' do
    customer = Customer.new
    expect(customer.check).to eq(@dishes)
  end

  it 'can identify a dish' do
    expect(subject.dishes).to include("Noodles = £3")
  end

end
