require 'sms'
require 'dotenv'
require 'twilio-ruby'

describe SMS do
  subject(:sms) { described_class.new }
  let(:order_time) { double :order_time }
  let(:phone_number) { double :phone_number }
  let(:takeaway) { double :takeaway }
  let(:client) { double :client, messages: messages }
  let(:messages) { double :messages }
  let(:credentials) do
    {
      account_sid: '123',
      auth_token: '23fds',
      from: '+123',
      to: '+234',
      body: "Thank you! Your order was placed and will be delivered before %s"
    }
  end

  it 'sends a text message' do
    args = {
      from: credentials[:from],
      to: credentials[:to],
      body: credentials[:body]
    }
    allow(messages).to receive(:create).with(args)
    allow(takeaway).to receive(:send_sms).with(:order_time, :phone_number)
    takeaway.send_sms(:order_time, :phone_number)
  end
end
