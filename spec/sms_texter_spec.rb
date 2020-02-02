require "sms_texter"

describe SmsTexter do
  describe " #send_sms" do
    it "exists" do
      expect(subject).to respond_to(:send_sms)
    end
  end

end