require 'checkout.rb'

describe Checkout do
  checkout = Checkout.new
  it 'can total my order' do
    checkout.add("chips", 1)
    checkout.add("salad", 2)
    expect(checkout.total).to eql(3)
  end
end
