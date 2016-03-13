require 'checkout'

describe Checkout do
  let(:client) { double :client, messages: messages }
  subject(:checkout) { described_class.new(client) }
  let(:messages) { double :messages, create: nil }

  ENV = { "ACCOUNT_SID" => "FAKE ID",
          "AUTH_TOKEN" => "FAKE TOKEN",
          "TWILIO_NUM" => "FAKE FROM",
          "MY_NUM" => "FAKE TO" }

  it 'should respond to send_sms method' do
    expect(checkout).to respond_to :send_sms
  end

  describe '#send_sms' do
    it 'should send a text message' do
      now = Time.parse("2016-03-12 22:57:38 +0000")
      allow(Time).to receive(:now).and_return(now)
      message = "Thank you! Your order was placed and will be delivered before 23:57"
      checkout.send_sms
      expect(client.messages).to have_received(:create).with({from: ENV["TWILIO_NUM"], to: ENV["MY_NUM"], body: message})
    end
  end
end
