require 'sms'

describe SMS do
  subject(:sms) { described_class.new(client, account_sid, auth_token, from, to) }

  let(:client) { double(:client, messages: messages) }
  let(:messages) { double(:messages, create: nil) }
  let(:account_sid) { double(:account_sid) }
  let(:auth_token) { double(:auth_token) }
  let(:from) { double(:from) }
  let(:to) { double(:to) }

  describe '#send_text' do
    it 'sends a text with ETA of delivery' do
      text_args = {
        from: from,
        to: to,
        body: "Thank you! Your order was placed and will be delivered before #{SMS::DELIVERY_TIME}."
      }

      sms.send_text
      expect(messages).to have_received(:create).with(text_args)
    end
  end
end
