require 'message'

describe Message do
  subject(:message) { described_class.new }
  let(:message2) { double:message }

  it "responds to #send_message" do
    expect(message).to respond_to(:send_message)
  end

  it "sends message" do
    allow(message2).to receive(:send_message).and_return("Thank you!")
    expect(message2.send_message).to eq "Thank you!"
  end
end
