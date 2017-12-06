require 'text'

describe Text do
  let(:time) { double(:time_class) }
  subject(:text) { described_class.new(time) }
  describe "#send_text" do
    it "sends a text to the customer's number" do
      fake_env = {
        "TWILIO_SID" => "fake_sid",
        "TWILIO_AUTH" => "fake_auth",
        "PHONE_NUMBER" => "my_number",
        "TWILIO_NUMBER" => "twilio_number"
      }
      allow(time).to receive_message_chain(:now, :+, :strftime).and_return "11:00"

      twilio_rest_client_double = double(:twilio_rest_client)
      client_double = double(:client)
      expect(twilio_rest_client_double).to receive(:new).with("fake_sid","fake_auth").and_return(client_double)
      messages_double = double(:messages)

      expect(client_double).to receive(:messages).and_return(messages_double)
      expect(messages_double).to receive(:create).with(
        from: "twilio_number",
        to: "my_number",
        body: "Thank you! Your order was placed and will be delivered before 11:00")
      text.send_text(twilio_rest_client_double, fake_env)
    end

  end

end
