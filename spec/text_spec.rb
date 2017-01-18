require 'text'

describe Text do
  let(:messages) do
    messages = double(:messages)
    allow(messages).to receive(:create)
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
    client_class = double(:twilio_client_double_class)
    allow(client_class).to receive(:new).and_return(client_instance)
    client_class
  end

  subject(:text) { Text.new(client) }

  describe '#send_message' do
    it 'succeeds' do
      expect { text.send_message }.not_to raise_error
    end
    it 'sends a confirmation text' do
      text.send_message
      expect(messages).to have_received(:create).with({
        body: "Thank you! Your order came to £0. You can expect your delivery in 20 minutes",
        to: "000",
        from: "111"
      })
    end
    it 'has the correct price in the text' do
      allow(text).to receive(:generate_message)
      allow(text).to receive(:send_message) { 10 }
      allow(text).to receive(:message)
      expect(text.send_message).to eq(10)
    end
  end
end
