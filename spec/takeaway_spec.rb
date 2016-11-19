require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new}

  it 'sends a payment confirmation text message' do
    expect(takeaway.accept_order(20.93)).to eq "Thank you for your order: £20.93"
  end

end
