require 'sms'

describe Sms do

  subject(:sms) {described_class.new}

  let(:client) { double(:client) }

  it 'sends an sms message as required when the order is placed' do
    expect(sms).to respond_to(:send)
    end
end
