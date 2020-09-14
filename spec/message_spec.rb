require "message"

describe Message do

  let(:time) { double "time" }
  subject(:message) { Message.new }

  it "responds to send_sms" do
    expect(message).to respond_to(:send_sms)
  end
end
