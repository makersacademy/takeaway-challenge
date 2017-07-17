require 'text_sender'

describe TextSender do
  let(:twilio_test_creds) {
    { account_sid: ENV["TWILIO_TEST_SID"],
      auth_token:  ENV["TWILIO_TEST_TOKEN"],
      from_no: ENV["TWILIO_TEST_FROM"],
      to_no: ENV["MY_PHONE_NO"]
    }
  }
  let(:message) { "Thank you! Your order was placed and will be delivered before #{Time.now.hour + 1}:#{Time.now.min}" }
  subject(:sender) { described_class.new(twilio_test_creds) }

  describe '#text' do
    it 'expected to send texts' do
      expect { sender.text(message) }.not_to raise_error
    end
  end
end
