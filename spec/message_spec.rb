require 'message'

RSpec.describe Message do

  let(:twilio_client_double) { double(:twilio_client) }
  let(:twilio_response_double) { double(:twilio_response) }
  subject(:message) { described_class.new(twilio_client_double) }

  it 'returns true when the message is sent' do
    allow(twilio_client_double).to receive_message_chain(:messages, :create).and_return(twilio_response_double)
    allow(twilio_response_double).to receive(:error_code).and_return(0)
    expect(message.send).to eq true
  end

  it 'returns false when there is an error_code' do
    allow(twilio_client_double).to receive_message_chain(:messages, :create).and_return(twilio_response_double)
    allow(twilio_response_double).to receive(:error_code).and_return(5)
    expect(message.send).to eq false
  end
end
