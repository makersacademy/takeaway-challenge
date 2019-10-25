require 'twilio'

describe TwilioClient do
  let(:twilio_client) { TwilioClient.new }

  describe "#client" do
    it { is_expected.to respond_to(:client) }
  end
end
