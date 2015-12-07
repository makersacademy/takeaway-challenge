require 'sms'

describe Sms do

  let(:message) { double(:message) }
  subject(:sms) { described_class.new }

  it 'send a text when the order is placed' do
    allow(sms).to receive(:send).with(message)
    expect { sms.send(message) }.not_to raise_error
  end

end
