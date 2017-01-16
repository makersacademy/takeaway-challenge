require "twilio_client.rb"

describe TwilioClient do

  subject(:twilio_client) { described_class.new }

  describe "#client" do
    it { is_expected.to respond_to(:client) }
  end

end
