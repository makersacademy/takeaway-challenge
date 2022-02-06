require_relative '../lib/twilio_sms'

describe TwilioSMS do

  let(:twilio_client_class) { class_double("Twilio::REST::Client") } 

  let(:failed_code) { double(:message, :error_code => 1) }
  let(:failed_messages) { double(:messages, :create => failed_code) }
  let(:failed_twilio_client) { double(:twilio_client, :messages => failed_messages) }
 

  let(:success_code) { double(:message, :error_code => nil) }
  let(:succesful_messages) { double(:messages, :create => success_code) }
  let(:succesful_twilio_client) { double(:twilio_client, :messages => succesful_messages) }

  let(:credentials) { double(:credentials, :account_id => "", :auth_token => "") }

  let(:from) { "2" }
  let(:to) { "1" }
  let(:body) { "Hello World!" }

  subject(:twilio_sms) { described_class.new(credentials) }


  it "raises an error when not successful in sending an SMS" do
    stub_const('Twilio::REST::Client', twilio_client_class)
    allow(twilio_client_class).to receive(:new).and_return(failed_twilio_client)
    expect { twilio_sms.send(from, to, body) }.to raise_error "Failed to send SMS"
  end

  it "sends an sms message" do
    stub_const('Twilio::REST::Client', twilio_client_class)
    allow(twilio_client_class).to receive(:new).and_return(succesful_twilio_client)
    expect { twilio_sms.send(from, to, body) }.not_to raise_error
  end
  
end
