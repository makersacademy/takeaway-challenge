require 'notifier'

describe Notifier do

  # building up for the 'account.messages.create'
  let(:messages) { double :twilio_messages }
  let(:account) { double :twilio_account, messages: messages }
  let(:client) { double :twilio_client, account: account }

  subject(:notifier) { described_class.new(client) }

  context '#send_message' do
    it 'sends a confirmation message' do
      expect(messages).to receive(:create).with({
        :from => ENV['TWILIO_NUMBER'],
        :to => ENV['TO_NUMBER'],
        :body => "Thank you for your order: £0.Order was placed and will be delivered before 18:52",
        })
      notifier.send_message(0)
    end
  end

end
