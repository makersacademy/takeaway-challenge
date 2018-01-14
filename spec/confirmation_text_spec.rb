require 'confirmation_text'

describe ConfirmationText do

  describe '#send' do

    it 'sends a text message' do
      client = double(:client)
      allow(Twilio::REST::Client).to receive(:new) { client }
      client.stub_chain(:messages, :create).and_return("hello")
      expect(client.messages.create).to eq("hello")
    end

  end

end
