require 'sms'

describe SMS do

  subject(:sms) { described_class.new }

  describe "#deliver_sms" do
    it "should deliver a text message" do
      expect(sms).to respond_to(:deliver_sms)
    end
  end

end
