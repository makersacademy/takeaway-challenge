require 'Text'

describe Text do
  subject(:text) { described_class.new }
  let(:client) { double("client") }


  describe "#send" do
    it 'sends a text message' do
      allow(client).to receive(:new).and_return(client)
      allow(client).to receive_message_chain(:messages, :create)
      expect(text.send).to eq("Text sent")
    end
  end
end
