require 'sms_service'

describe SMSService do
  let(:conf_mess) { double :conf_mess, text: "Thank you! Your order was placed", sid: 'sent' }
  let(:conf_mess_class) { double :conf_mess_class, new: conf_mess }
  let(:messages) { double :messages, create: conf_mess }
  let(:client) { double :client, messages: messages } 
  let(:number) { '00000000' }
  subject { described_class.new(number, confirmation_message_class: conf_mess_class, client: client) }
  
  describe '#send_sms' do
    it 'send an sms' do
      expect(conf_mess).to receive(:sid)
      subject.send_sms
    end
  end

  describe '#create_message' do
    it 'creates a new confirmation message object' do
      expect(conf_mess_class).to receive(:new)
      subject.create_message
    end

    it 'creates a confirmation message' do
      expect(conf_mess).to receive(:text)
      subject.create_message
    end

    it 'adds the confirmation message to client - calling messages' do
      expect(client).to receive(:messages)
      subject.create_message
    end

    it 'adds the confirmation message to client - create message' do
      expect(messages).to receive(:create)
      subject.create_message
    end

  end
end
