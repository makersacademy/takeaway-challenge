require 'twilio_client'

describe TwilioClient do
  subject(:client) { described_class.new("+44 115 824 3978", "+44 7950 290690") }

  before { allow(client).to receive(:send_sms).and_return({ body: "Sent from your Twilio trial account - test message", error_code: 0 }) }

  it "should get the client on initialize" do
    expect(client.client).to_not be_nil
  end

end
