require "sms_receiver.rb"

describe SMSReceiver do

  let(:test_twilio_client_class) { double("TestTwilioClientClass") }
  let(:test_client_instance) { double("TestTwilioClient") }
  let(:test_client) { double("TestClient") }
  let(:messages) { double("Messages") }
  subject(:sms_receiver) { described_class.new(test_twilio_client_class) }

  # describe "#message" do
  #   it "calls to TwilioClient without raising error" do
  #     allow(test_twilio_client_class).to receive(:new) { test_client_instance }
  #     allow(test_client_instance).to receive(:client) { test_client }
  #     allow(test_client).to receive(:messages) { messages }
  #     allow(messages).to receive(:create) { true }
  #     expect{sms_messager.message("message string")}.not_to raise_error
  #   end
  # end
end
