require "message"

describe Message do
  let(:a_random_message) { double :message }
  context "#initialize" do
    it "should have a phone number" do
      expect(subject.takeaway_number).to eq(subject.takeaway_number)
    end

    it "should have a TWILIO client" do
      expect(subject.client).to be_a(Twilio::REST::Client)
    end
  end

  context "#send" do
    it { is_expected.to respond_to(:send).with(2).arguments }
  end
end
