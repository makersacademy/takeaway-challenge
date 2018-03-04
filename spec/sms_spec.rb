require 'sms'

describe SMS do
  subject(:sms) { described_class.new }

  describe "sends a text to customers" do

    it "when the order is successfully placed" do
      expect(sms).to respond_to(:send_sms)
    end

  end
end
