require_relative '../lib/twilio_sms'

describe TwilioSMS do

  let(:failed_code) { double(:message, :error_code => 1) }
  let(:failed_messages) { double(:messages, :create => failed_code) }
  let(:failed_twilio_client) { double(:twilio_client, :messages => failed_messages) }

  let(:error_code) { double(:message, :error_code => nil) }
  let(:messages) { double(:messages, :create => error_code) }
  let(:succesful_twilio_client) { double(:twilio_client, :messages => messages) }

  let(:from) { "2" }
  let(:to) { "1" }
  let(:body) { "Hello World!" }
  
  it "raises an error when not successful in sending an SMS" do
    twilio_sms = described_class.new(failed_twilio_client) 
    expect { twilio_sms.send_sms(from, to, body) }.to raise_error "Failed to send SMS"
  end

  it "sends an sms message" do
    twilio_sms = described_class.new(succesful_twilio_client) 
    expect { twilio_sms.send_sms(from, to, body) }.not_to raise_error
  end
  
end
