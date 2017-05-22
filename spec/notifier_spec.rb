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

  context '#send_message' do
    it 'sends a confirmation message' do
      notifier.send_message(0)
      expect(messages).to have_received(:create).with({
        :from => TWILIO_NUMBER,
        :to => TO_NUMBER,
        :body => "Thank you for your order: £0. Order was placed and will be delivered before 18:52",
        :media_url => nil,
        })
    end

  end


end
