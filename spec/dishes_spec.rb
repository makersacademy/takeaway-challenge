require 'customer'
require 'dishes'

describe Dishes do

  it 'should display the dishes and prices to the customer' do
    #Arrange
    customer = Customer.new
    dish = Dishes.new
    #Assert
    expect(customer.check).to eq(@dishes)
  end

  it 'can identify a dish' do
    #Assert
    expect(subject.dishes).to include("Noodles = £3")
  end

end
