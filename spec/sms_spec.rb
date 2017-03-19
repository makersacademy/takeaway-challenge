require 'sms'

describe SMS do
  subject(:sms) {described_class.new}

  it 'method send_sms accepts one argument, the text to be sent ' do
    expect(sms).to respond_to(:send_sms).with(1).argument
  end
end
