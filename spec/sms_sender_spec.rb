require "sms_sender"

describe SmsSender do
  describe "#initialize" do
  end

  describe "#send_text" do
    it "Sends an SMS with the delivery message" do
      tw_testacc_sid = "ACccb2dbca9aea7869f0ab7bbbdca1df82" # Enter test acc_sid here
      tw_test_token = "2bf2f033df709c2079d8ee1182a16315" # Enter test authorisation token here
      tw_testnum = "+15005550006" # This is Twilio's magic phone  number for test
      sms_sender = SmsSender.new
      expect(sms_sender.send_text("test", tw_testacc_sid, tw_test_token, tw_testnum)).to be_truthy
    end
  end
end
