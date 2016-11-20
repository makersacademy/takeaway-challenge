require "sms"

describe SMS do
  subject(:sms) {described_class.new}
  let(:sms_d) {double :sms}
  context "when #new_client" do
    it "should create a new Twilio client" do
      expect{sms.new_client}.to_not raise_error
    end
  end
  context "when #text_message it" do
    it "should send a message to 07414991997" do
      expect(sms_d).to receive(:text_message).with("This is your first message")
      sms_d.text_message("This is your first message")
     end
  end

end
