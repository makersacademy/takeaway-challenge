require 'message_sender.rb'

describe MessageSender do

  let(:message) { described_class.new }
  let(:number) {double(:number) }
  let(:body) {double(:body) }

  it "should send a message" do
    allow(message).to receive(:send_message).and_return("order confirmation sent")
    expect(message.send_message(number, body)).to be_truthy
  end

end
