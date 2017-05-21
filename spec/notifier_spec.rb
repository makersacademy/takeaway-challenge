require 'notifier'

describe Notifier do

  # building up for the 'account.messages.create'
  let(:messages) do
    message = double(:messages)
    allow(message).to receive(:create)
    messages
  end

  let(:account) do
    account = double(:account)
    allow(account).to receive(:messages).and_return(messages)
    account
  end

  let(:client_instance) do
    client_instance = double(:client_instance)
    allow(client_instance).to receive(:account).and_return(account)
    client_instance
  end

  let(:client) do
    client_class = double(:twilio_client_class)
    allow(client_class).to receive(:new).and_return(client_instance)
    client_class
  end

  subject(:notifier) { described_class.new }

  describe '#send_message' do
    it 'successfully sends a message' do
      expect { notifier.send_message(:text) }.not_to raise_error
    end


  end

end
