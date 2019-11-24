require 'message_client'

RSpec.describe MessageClient do
  let(:twilio) { double(:REST_client) }
  let(:test_message_client) { MessageClient.new(twilio) }
  let(:sam) { Customer.new(:sam, ENV['MY_PHONE_NUMBER'], 100) }

  before(:each) do
    allow(twilio).to receive(:messages).and_return true
    allow(twilio.messages).to receive(:create)
  end

  context 'when sending messages'
  it 'confirms a message has been sent' do
    expect(test_message_client.confirm_order(sam)).to eq 'message sent'
  end

  it 'reports when a message fails to send' do
    allow(twilio.messages).to receive(:create) { raise 'error' }

    expect(test_message_client.confirm_order(sam)).to eq 'message failed to send'
  end
end
