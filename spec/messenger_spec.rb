require 'messenger'
require 'dotenv/load'

describe 'messenger' do
  let(:messenger) { Messenger.new(twilio_class) }
  let(:twilio) { double(:twilio) }
  let(:twilio_class) { double(:twilio_class, new: twilio) }
  
  
  before(:each) do
    allow(twilio).to receive_message_chain(:api, :account, :messages, :create)
  end

  context '#send' do

    it 'responds when provided one argument' do
      expect(messenger).to respond_to(:send_message).with(1).argument
    end

    it 'calls the create method with a body containing the passed in message' do
      expect(twilio).to receive_message_chain(:api, :account, :messages, :create)
        .with(from: ENV['TWILIO_PHONE_NUMBER'],
          to: ENV['MY_PHONE_NUMBER'],
          body: 'Test String'
        )
      messenger.send_message('Test String')
    end
  end

end