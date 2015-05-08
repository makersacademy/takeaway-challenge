require 'send_sms'

describe SendSMS do
  context 'uses twilio API' do
    let(:client) { double :client }
    it 'initializes the client' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      expect(subject.client).to be client
    end

    it 'tries to send a message' do
      allow(Twilio::REST::Client).to receive(:new).and_return(client)
      allow(client).to receive_message_chain(
        'account.messages.create')
      expect(subject.send('message')).to eq 'message'
    end
  end
end
