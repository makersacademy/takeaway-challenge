require "sms"

describe SMS do
  subject(:sms) { described_class.new }

  describe "#send_sms" do
    it "expects send_sms to run and get confirmation message" do
      stub_const("Twilio::REST::Client", Class)
      allow(Class).to receive(:new).and_return(sms)
      allow(sms).to receive(:messages).and_return(sms)
      allow(sms).to receive(:create).and_return(sms)
      expect(subject.send_sms).to eq("SMS delivered")
    end
  end
end
