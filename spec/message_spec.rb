require 'message'

describe Message do
  let(:client) { double :client }
  subject(:message) { described_class.new(client) }

  describe "#send" do
    xit { is_expected.to respond_to(:send) }
    it "sends a message with delivery time" do

    end
  end
end
