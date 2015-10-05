require 'text'

describe Text do
  describe '#send_sms' do
    it 'sends sms confirmation of customer order' do
      client = double :client
      allow(client).to receive_message_chain(:messages, :create)
      expect(Twilio::REST::Client).to receive(:new).and_return(client)
      subject.send_text('hello')
    end
  end

end
