require 'messenger'

describe Messenger do

  let(:client_message) { double :client_meesage, create: nil }
  let(:client) { double :client, messages: client_message }
  subject(:messenger) { described_class.new(client) }

  describe '#sms_confirmation' do
    it 'lets user know that a confirmation has been sent to the customer' do
      expect(messenger.sms_confirmation).to eq "sms confirmation sent"
    end
  end
end
