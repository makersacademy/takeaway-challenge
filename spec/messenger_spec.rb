require "messenger"

describe Messenger do
  let(:client) { double :client, account: account }
  let(:account) { double :account, messages: messages }
  let(:messages) { double :message, create: nil }

  describe "#send" do
    it "should send a text message" do
      # ENV["TWILIO_NUMBER"] = "12345"
      # ENV["RECEIVER_NUMBER"] = "54321"
      expect(messages).to receive(:create)
      # .with(
      # from: ENV["TWILIO_NUMBER"],
      # to: ENV["RECEIVER_NUMBER"],
      # body: "hello")
      subject.send("hello")
    end
  end

  describe "#delivery_time" do
    it "should inform customer of delivery time" do
      now = Time.parse("2016-03-12 22:57:38 +0000")
      allow(Time).to receive(:now).and_return(now)
      message = "It will be delivered before 23:57. :)"
      expect(subject.delivery_time).to eq message
    end
  end
end
