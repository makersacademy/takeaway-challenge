require 'sendtext'

describe TwilioController do

  let(:client) { double :client }

  before do
    subject.instance_variable_set(:@client, client)
  end

  context '#send_text_message' do

    it 'sends a text' do
      message = ""
      expect(client).to receive_message_chain(:messages, :create)
      subject.send_text_message(message)
    end
  end

end
