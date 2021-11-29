require 'twilio_provider'

describe TwilioProvider do
  let(:twilio) { TwilioProvider.new }
  it "sends a text" do
    expect_any_instance_of(twilio).to receive(:send_text).with(hash_including(:body, :to, :from))
  end
end
