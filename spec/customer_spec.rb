require 'customer.rb'

describe Customer do

  it 'should respond to view menu' do
    c1 = Customer.new 123
    expect(c1).to respond_to :menu
  end

  it 'should respond to place order' do
    c1 = Customer.new 123
    expect(c1).to respond_to(:place_order).with(1).argument #check with Alumi
  end

  it 'should take the order and put it in the order array' do
    c1 = Customer.new 123
    c1.place_order "chicken_curry"
    expect(c1.order).to include(5.00)
  end

  it 'should respond to check total bill' do
    c1 = Customer.new 123
    expect(c1).to respond_to :check_total
  end

  it 'check total should work out current order total' do
    c1 = Customer.new 123
    c1.place_order "chicken_curry", "cobra"
    expect(c1.check_total).to eq("Current order total is £8.50")
  end

end
