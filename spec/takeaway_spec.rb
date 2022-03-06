require 'takeaway.rb'

describe Takeaway do

  let(:order_double) { double(:order_double, :finalise => 8.25) }

  it 'should accept an order on initialisation' do
    takeaway = Takeaway.new(order_double)
    expect(takeaway.order).to eq order_double
  end

  it 'should verify an inputted price matches the total order' do
    takeaway = Takeaway.new(order_double)
    expect(takeaway.check_order_price(8.25)).to eq true
  end

end