require 'textmessage'

describe TextMessage do
  it { is_expected.to be_instance_of(TextMessage) }

  describe "#send_message" do
    it "sends a text message confirming the order" do
    expect_any_instance_of(Twilio::REST::Client). to receive_message_chain(:messages, :create)
    subject.send_message(123)
  end
  end
end
