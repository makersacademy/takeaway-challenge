require 'customer'
require 'dishes'

describe Dishes do

  it 'should display the dishes and prices to the customer' do
    customer = Customer.new
    dish = Dishes.new
    expect(customer.check).to eq(@dishes)
  end

end
