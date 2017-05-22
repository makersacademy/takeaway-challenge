require 'sms'

describe Sms do
  describe '#send' do # does not test body
    it 'test' do
      client = double(:twilio_rest_client)
      sms = Sms.new(client)
      expect(client).to receive_message_chain(:account, :messages, :create)
      sms.send('test')
    end
  end

  describe '#send' do # test, but lots of cascading
    it 'test2' do
      messages = double(:twilio_thing_with_messages)
      account = double(:twilio_thing_with_an_account, messages: messages)
      client = double(:twilio_rest_client, account: account)
      sms = Sms.new(client)
      expect(messages).to receive(:create).with(body: 'woop', to: '12345', from: '435635634')
      sms.send('test')
    end
  end
end
