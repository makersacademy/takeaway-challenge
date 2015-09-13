require 'customer.rb'

describe Customer do

  it 'should respond to view menu' do
    c1 = Customer.new 12345
    expect(c1).to respond_to :menu
  end

  it 'should respond to place order' do
    c1 = Customer.new 12345
    expect(c1).to respond_to(:place_order).with(1).argument
  end

  it 'should take the order and put it in the order array' do
    c1 = Customer.new 12345
    c1.place_order "chicken_curry"
    expect(c1.order).to include(5.00)
  end
end