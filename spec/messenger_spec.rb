require 'messenger'

describe Messenger do

  subject(:messenger) { described_class.new(client) }
  let(:client) { double(:client) }



  let(:total) { 10 }
  let(:delivery_time) { Time.now + 3600 }
  let(:body) {
    "Thank you for your order. Delivery estimated for " +
    "#{delivery_time.strftime('%H:%M')}. The total came to #{total}"
  }
  let(:messages_client) { double(:messages_client)}
  let(:message) { double (:message) }



  describe '#send' do
    it 'delivers a message with an estimated time' do
      expect(messenger.body(total)).to eq body
    end

    it 'delivers a message with an estimated time' do
      settings =
        {
          from: Messenger::CONF[:from],
          to: Messenger::CONF[:to],
          body: body
        }
      allow(client).to receive(:messages).and_return(messages_client)
      allow(messages_client).to receive(:create).with(settings).and_return(message)
      expect(messenger.send(total)).to eq message
    end
  end
end
