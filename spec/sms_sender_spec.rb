require "sms_sender.rb"

describe SmsSender do
  describe "#initialize" do
    it "takes the argument 'delivery_message' and assigns it to a variable" do
      sms_sender = SmsSender.new("test")
      expect(sms_sender.delivery_message).to eq "test"
    end
  end

  describe "#send_text" do
    it "Sends an SMS with the delivery message" do
      tw_testacc_sid = "ACccb2dbca9aea7869f0ab7bbbdca1df82"
      tw_test_token = "2bf2f033df709c2079d8ee1182a16315"
      tw_testnum = "+15005550006"
      sms_sender = SmsSender.new("test message")
      expect(sms_sender.send_text(tw_testacc_sid, tw_test_token, tw_testnum)).to be_truthy
    end
  end
end
