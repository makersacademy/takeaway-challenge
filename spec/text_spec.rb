require 'text'

describe Text do
  subject { described_class.new(client) }
  let(:client) { double :client, messages: double() }

  it { is_expected.to respond_to(:send_sms) }

  describe '#send_sms' do
    it 'sends a text message' do
      from = ENV['TWILIO_FROM']
      to = ENV['TWILIO_TO']
      body = 'Your order will be delivered before 17:00'
      expect(client.messages).to receive(:create).with(from, to, body)

      subject.send_sms
    end
  end
end
