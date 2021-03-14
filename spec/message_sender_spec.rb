require 'message_sender'

describe MessageSender do
  alias_method :message_sender, :subject
  describe '#send_message' do
    it 'calls the client to send a message' do
      api_spy = double("api_spy")
      account_spy = double("account_spy")
      messages_spy = double("messages_spy")
      client = spy(:client_spy, api: api_spy)
      allow(api_spy).to receive(:account) {account_spy}
      allow(account_spy).to receive(:messages) {messages_spy}
      allow(messages_spy).to receive(:create)
      message_sender.instance_variable_set(:@client, client)
      message_sender.send_message(ENV['MY_NUMBER'],"Hello")
      expect(client).to have_received(:api).once
    end
  end
end
