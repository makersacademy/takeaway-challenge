require 'messenger'

describe Messenger do
  let(:messages) { double(:messages, create: nil) }
  let(:twilio_client) { double(:client, messages: messages) }
  let(:twilio_client_class) { double(:client_class, new: twilio_client) }

  subject(:messager) { described_class.new(twilio_client_class) }

  it "should have an account_sid" do
    expect(messager.account_sid).to eq ENV['twilio_account_sid']
  end

  it "should have an auth_token" do
    expect(messager.auth_token).to eq ENV['twilio_auth_token']
  end

  it "should have a phone number" do
    expect(messager.phone_number).to eq ENV['twilio_phone_number']
  end

  describe "#send_message" do
    it "should try to send a message to the phone number" do
      expect(messages).to receive(:create)
        .with(to: '334654', from: messager.phone_number,
              body: 'Hello there')
      messager.send_message('334654', 'Hello there')
    end
  end
end
