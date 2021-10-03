require "sms_sender"

# tw_testacc_sid = "ACccb2dbca9aea7869f0ab7bbbdca1df82"
# tw_test_token = "2bf2f033df709c2079d8ee1182a16315"
# tw_testnum = "+15005550006"

describe SmsSender do
  describe "#initialize" do
  end

  describe "#send_text" do
    it "Sends an SMS with the delivery message" do
      tw_testacc_sid = "ACccb2dbca9aea7869f0ab7bbbdca1df82"
      tw_test_token = "2bf2f033df709c2079d8ee1182a16315"
      tw_testnum = "+15005550006"
      sms_sender = SmsSender.new
      expect(sms_sender.send_text("test", tw_testacc_sid, tw_test_token, tw_testnum)).to be_truthy
    end
  end
end
