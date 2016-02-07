require_relative '../lib/sms'

describe Sms do
  subject(:sms) {described_class.new}

  describe "#send" do
    it "expects to raise error" do
      allow(sms).to receive(:client) {nil}
      expect {sms.send(123)}.to raise_error
    end
  end

  describe "#text" do
    it "return a string" do
      expect(sms.text(123)).to be_a String
    end
  end
end
