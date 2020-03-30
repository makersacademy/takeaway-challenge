require 'texter'

describe Texter do
  let(:mobile) { Texter.new(num: nil, text_time: Time.now) }
  context "accessing API stuff " do
    it "should be able to access  account_sid from api_stuff.json if present" do
      expect(mobile.account_sid).not_to eq(nil)
    end
    it "should be able to access  AUTH_TOKEN from api_stuff.json if present" do
      expect(mobile.auth_token).not_to eq(nil)
    end
    it "should be able to access  TWILIO_NUMBER from api_stuff.json if present" do
      expect(mobile.from).not_to eq(nil)
    end
  end
  context "sending the message" do
    it " should be able to make the call" do
      expect(mobile).to respond_to(:make_the_call)
    end
  end
end
