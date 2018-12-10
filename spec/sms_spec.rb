require "sms"

describe SMS do
  subject(:sms) { described_class.new(client: client) }

  let(:client) { double(:client) }


  describe "#delivery" do
    it "it sends an SMS with an estimated delivery time" do
      sms.delivery
    end
  end
end
