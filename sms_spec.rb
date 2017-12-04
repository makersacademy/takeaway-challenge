require "sms"

describe SMS do

  subject(:sms) { described_class.new }

  describe "#send_sms" do
    it "sends a confirmation text message" do
      fake_env = {
        "TWILIO_ACCOUNT_SID" => "fake_account_sid",
        "TWILIO_AUTH_TOKEN" => "fake_auth_token",
        "MY_PHONE_NUMBER" => "my_number",
        "TWILIO_NUMBER" => "twilio_number"
      }
      twilio_rest_client_double = double(:twilio_rest_client)
      client_double = double(:client)
      expect(twilio_rest_client_double).to receive(:new)
        .with("fake_account_sid", "fake_auth_token")
        .and_return(client_double)
      messages_double = double(:messages)
      expect(client_double).to receive(:messages).and_return(messages_double)
      expect(messages_double).to receive(:create)
        .with(
          to: "my_number",
          from: "twilio_number",
          body: "Order successful. Estimated delivery time 12:00"
        )
      sms.send_sms(twilio_rest_client_double, fake_env)
    end
  end

end
