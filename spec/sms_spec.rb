require "sms"

describe SMS do
  let(:credentials) do
    {
      "sid": "fff",
      "auth_token": "fff",
      "number": "333"
    }
  end
  context "SMS class" do
    it "can set credentials" do
      expect(subject.credentials(credentials)).to eq(credentials)
    end

    it "responds to send sms" do
      expect(subject).to respond_to(:send_sms)
    end

    it "sends an sms" do
      subject.set_credentials(credentials)
    end
  end
end
