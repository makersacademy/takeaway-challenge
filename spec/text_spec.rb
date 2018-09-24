require 'text'

describe Text do

  let(:messages) { double :messages }
  let(:account) { double :account, messages: messages }
  let(:api) { double :api, account: account }
  let(:client) { double :client, api: api }
  let(:client_class) { double :client_class, new: client }

  describe 'send'
    it 'calls create on messages of client' do
      text = described_class.new(client_class)
      allow(messages).to receive(:create)
      expect(messages).to receive(:create).with(an_instance_of(Hash))
      text.send(13)
    end

end
