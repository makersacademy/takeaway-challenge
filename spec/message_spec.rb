require 'message'

describe Message do
  let(:client) { double :client }
  subject { described_class.new(client: client) }

  describe "#send" do
    it "should create a new txt message" do
      expect(client).to receive_message_chain(:messages, :create)
      subject.send
    end
  end
end
