require "sms"

describe SMS do
  let(:credentials) do
    {
      "sid": "ACf9cfb514cdfd388e27ac383d54401055",
      "auth_token": "3c6fa963c0e747e0ace54fd71bc48057",
      "number": "+12014706871"
    }
  end
  context "SMS class" do
    it "can set credentials" do
      expect(subject.set_credentials(credentials)).to eq(credentials)
    end

    it "responds to send sms" do
      expect(subject).to respond_to(:send_sms)
    end

    it "sends an sms" do
      subject.set_credentials(credentials)
    end
  end
end