require 'sms'

describe SMS do
let(:order) {Class.new}
subject(:sms) { described_class.new }
let(:message) { double :message }
let(:client) { double :client }


  it "sends a message" do
      allow(sms.client).to receive_message_chain(:account, :messages, :create).and_return("message sent")
      expect(sms.send_text(message)).to eq "message sent"
  end
end
