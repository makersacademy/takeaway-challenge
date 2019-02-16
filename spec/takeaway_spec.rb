require './lib/takeaway'
require './lib/order'

describe Takeaway do
  it 'displays a menu of dishes on offer' do
    expect(subject.menu).to include 'noodles'
  end

  it 'allows an order to be initiated' do
    subject.new_order
    expect(subject.order).to be_a Order
  end

  it 'allows an order to be placed' do
    subject.new_order
    subject.place_order
    expect(subject.order.placed?).to eq true
  end
end
