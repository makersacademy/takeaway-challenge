require 'takeaway'

describe Takeaway do

  let(:takeaway) {Takeaway.new}
  let(:order) { double :order, total_cost: 10}

  it 'raises an error if the incorrect amount is paid' do
    expect{takeaway.process_order(order, 15)}.to raise_error "Wrong amount paid"
  end

  it 'confirms a text will be sent if amount paid is correct' do
    expect(takeaway.process_order(order, 10)).to eq "Your order is processed, text confirming this will be sent shortly"
  end

end
