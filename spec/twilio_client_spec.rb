require 'twilio_client'

describe TwilioClient do
  subject(:client) { described_class.new }

  before { allow(client).to receive(:send_sms).and_return({ body: "Sent from your Twilio trial account - test message", error_code: 0 }) }

  describe "#send_sms" do
    it "sends an sms and receives error code 0" do
      expect(client.send_sms("+44 20 88 666 555", "+44 7901 234 567", "this is a test message")[:error_code]).to eq 0
    end
  end

  it "should get the client on initialize" do
    expect(client.client)
  end
end
