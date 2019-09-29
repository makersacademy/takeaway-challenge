require 'messenger'

describe Messenger do

  let(:client2) { double :client2, create: nil}
  let(:client) { double :client, messages: client2 }
  subject(:messenger) { described_class.new(client) }

  describe '#sms_confirmation' do
    it 'lets user know that a confirmation has been sent to the customer' do
      expect(messenger.sms_confirmation).to eq "sms confirmation sent"
    end
  end
end
