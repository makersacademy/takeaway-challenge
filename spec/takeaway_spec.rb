require 'takeaway'

describe Takeaway do
  it 'shows a menu of dishes' do
    expect(subject.menu).to be_an Array
  end

  it 'allows a customer to start an order' do
    order = double(:total => 0)
    expect(subject.start_order(order)).to eq order
  end

  pending 'allows a customer to place an order' do
    order = double(:total => 10)
    expect(subject.place_order(order)).to eq true
  end

end
