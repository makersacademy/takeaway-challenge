require 'send_sms'

describe TextMessager do

  subject(:text) { described_class.new(twilio_cc_double) }
  let(:twilio_cc_double) { double :twilio_cc, new: client_double }
  let(:client_double) { double :client, messages: message_double }
  let(:message_double) { double :message, create: true}

  it { is_expected.to be_instance_of(TextMessager) }

  describe ".send" do
    it 'sends a text' do
      expect(text.send).to eq(true)
    end
  end
end
