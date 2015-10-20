require "twilio_ruby"

describe TwilioRuby do

  describe ".send_sms_request" do
    it "responds to send_sms_request" do
      expect(subject).to respond_to :send_sms_request
    end

    it "creates a new twilio client with account_sid and auth_token" do
      client = double :client
      allow(client).to receive_message_chain(:messages, :create)
      expect(Twilio::REST::Client).to receive(:new).and_return(client)
      subject.send_sms_request
    end

    it "calls messages and create on new twilio client" do
      client = double :client
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(client).to receive_message_chain(:messages, :create)
      subject.send_sms_request
    end
  end

  describe ".sms_content" do
    it "responds to sms_content" do
      expect(subject).to respond_to :sms_content
    end

    it "sends the sms content" do
      delivery_time = Time.new + 3600
      expect(subject.sms_content).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    end
  end

end
