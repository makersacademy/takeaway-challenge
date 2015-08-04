require 'twilio_message'

describe TwilioMessage do
  describe "#text_message" do
    it "should respond to text message" do
      expect(subject).to respond_to(:text_message)
    end
  end

  describe "#payment_message" do
    it "should return a thank you note" do
      time = Time.new + 1800
      expect(subject.payment_message(8)).to eq "Thank you! Your order of $8 was place and will be delivered before #{time.strftime("%I:%M %p")}"
    end
  end
end
