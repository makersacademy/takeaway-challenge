require "sms"

describe SMS do

  subject(:sms) { described_class.new }

  describe "#send_sms" do
    it "sends a confirmation text message" do
      expect(sms).to receive(:send_sms).and_return("Order successful. Estimated delivery time 19:00")
      sms.send_sms
    end
  end

end
