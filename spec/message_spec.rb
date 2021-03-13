require 'message'

describe Message do
  context "initialize" do
    it "has an account_sid with a length of 34" do
      expect(subject.account_sid.size).to be(34)
    end
    it "has an auth_token with a length of 32" do
      expect(subject.auth_token.size).to be(32)
    end
    it "has a twilio REST client" do
      expect(subject.client).to be_a(Twilio::REST::Client)
    end
  end
  
  describe "message" do
    it ""
  end
end