require 'messenger'


describe Messenger do

  subject(:messenger) { described_class.new }
  let(:client) { double :client }

  before {allow(Twilio::REST::Client).to receive(:new) {client}}

  describe '#send' do
    it 'sends messages to tel numbers' do
      allow(client).to receive_message_chain('account.messages.create')
      expect(messenger.send).to eq "Your message was successfully sent"
    end
  end
end
