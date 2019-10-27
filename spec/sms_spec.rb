require "sms"

describe SMS do
  subject(:sms) { described_class.new(credentials) }
  let(:credentials) do
    {
      "sid": "fff",
      "auth_token": "fff",
      "number": "333"
    }
  end
  context "sending texts" do
    it "can set credentials" do
      expect(subject.credentials(credentials)).to eq(credentials)
    end

    it "responds to send sms" do
      expect(subject).to respond_to(:send_sms)
    end
  end
end
