require 'takeaway'

describe Takeaway do

  let(:takeaway) { described_class.new(sms) }
  let(:klass) { double(:klass) }
  let(:sms) { double(:sms)}

  before { allow(sms).to receive(:new).and_return sms }

  it 'accepts an SMS object on initialization' do
    expect(takeaway.message_type).to eq sms
  end

  it 'sends a payment confirmation text message' do
    expect(takeaway.accept_order(20.93)).to eq "Thank you for your order: £20.93"
  end

end
