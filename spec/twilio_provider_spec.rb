require 'twilio_provider'

describe TwilioProvider do
  it { is_expected.to respond_to :send_text }
#   let(:twilio) { double('twilio') }
#   it "sends a text" do
#     allow(twilio).to receive(:send_text).and_return(:body, :to)
#     twilio.send_text
#     expect(twilio).to receive(:send_text).with(hash_including(:body, :to))
#   end
end
