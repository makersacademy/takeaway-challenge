require "sms"

describe SMS do
  subject(:sms) { described_class.new }

  describe "#send_sms" do
    it "expects send_sms to run and get confirmation message" do
      expect(subject.send_sms).to eq("SMS delivered")
    end
  end
end
