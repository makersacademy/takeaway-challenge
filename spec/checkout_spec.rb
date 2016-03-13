require 'checkout'

describe Checkout do
  subject(:checkout) { described_class.new(client_class) }
  let(:client) { double :client, messages: messages }
  let(:client_class) { double :client_class, new: client }
  let(:messages) { double :messages, create: nil }
  let(:from) { 123 }
  let(:to) { 456 }
  let(:body) { "hello" }

  it 'should respond to send_sms method' do
    expect(checkout).to respond_to :send_sms
  end

  describe '#send_sms' do
    it 'should send a text message' do
      checkout.send_sms
      expect(client.messages).to have_received(:create).with({from: from, to: to, body: body})
    end
  end
end
