require 'checkout'

describe Checkout do
  let(:client) { double :client, messages: messages }
  subject(:checkout) { described_class.new(client) }
  let(:messages) { double :messages, create: nil }  

  it 'should respond to send_sms method' do
    expect(checkout).to respond_to :send_sms
  end

  describe '#send_sms' do
    it 'should send a text message' do
      checkout.send_sms
      expect(client.messages).to have_received(:create)
    end
  end
end
