require 'sms'

describe Sms do
  subject(:text) { described_class.new(customer: customer) }

  let(:customer) { double(:customer, messages: messages) }
  let(:messages) { double(:messages) }

  it 'delivers a message with delivery time after order is placed' do
    allow(messages).to receive(:create)
    text.send_message
  end
end
