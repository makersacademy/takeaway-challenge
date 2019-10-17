require 'customer'
require 'dishes'

describe Dishes do

  it 'should display the dishes and prices to the customer' do
    customer = Customer.new
    expect(customer.check).to eq(subject.dishes)
  end

  it 'can identify a dish' do
    expect(subject.dishes).to include("Chicken")
  end

end
