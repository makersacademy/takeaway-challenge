require 'adapter'

describe Adapter do
  subject(:adapter) {described_class.new(client_class)}
  let(:client_class) {double(:client_class, new: client)}
  let(:client) {double(:client)}
  let(:message) do
    double(:message,
    body: 'peking duck-1',
    from: '+44999',
    sid: '012',
    redact: nil)
  end

  describe '#send_sms' do
    it 'Passes #account.messages.create to client API' do
      allow(client).to receive_message_chain(:account, :messages, :create)
      expect(client).to receive(:account)
      adapter.send_sms('Hello')
    end
  end

  describe '#download_inbound_messages' do
    before do
      allow(client).to receive_message_chain(:account, :messages, :list).and_return([message])
    end

    it 'Passes #account.messages.list to client API' do
      expect(client).to receive(:account)
      adapter.download_inbound_messages
    end
    it 'Iterates to select inbound messages' do
      out = [['+44999','peking duck-1']]
      expect(adapter.download_inbound_messages).to eq(out)
    end
  end

  describe '#update_messages' do
    before do
      allow(client).to receive_message_chain(:account, :messages, :list).and_return([message])
      allow(client).to receive_message_chain(:account, :messages, :get).and_return(message)
    end
    it 'Passes #account.messages.list to client API' do
      expect(client).to receive_message_chain(:account, :messages, :list)
      adapter.update_messages
    end
    it 'Gets list of message SIDs from client API' do
      expect(client).to receive_message_chain(:account, :messages, :get)
      adapter.update_messages
    end
    it 'Redacts each message in message log' do
      expect(message).to receive(:redact)
      adapter.update_messages
    end
  end

end
