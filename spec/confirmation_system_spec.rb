require 'confirmation_system'

describe ConfirmationSystem do
  subject(:sms) {described_class.new(client)}
  let(:client) {double(:client, messages: messages)}
  let(:messages) {double(:messages)}

  describe '#initialization' do
    it 'has a client saved to a variable' do
      expect(sms.instance_variable_get(:@client)).to eq client
    end
  end

  describe '#send' do
    it 'sends a message' do
      expect(messages).to receive(:create)
      sms.send("test")
    end
  end
end
