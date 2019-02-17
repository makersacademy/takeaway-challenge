require './lib/messenger.rb'

describe Messenger do
  let(:messenger) { Messenger.new }
  let(:messages_double) { double('messages', create: nil) }
  let(:twilio_client_double) { double('twilio_client', messages: messages_double) }
  let(:twilio_class_double) { double('twilio_class', new: twilio_client_double) }

  let(:mobile_number) { '077361387311' }
  let(:message) { 'some message' }

  let(:expected_message) { 
    {
      from: Messenger::TWILIO_PHONE_NUMBER,
      to: mobile_number,
      body: message
    }
  }
  
  it 'should send a message to the specified number' do
    stub_const('Twilio::REST::Client', twilio_class_double)

    messenger.send_message(mobile_number: mobile_number, message: message)

    expect(messages_double).to have_received(:create).with(expected_message)
  end
end
