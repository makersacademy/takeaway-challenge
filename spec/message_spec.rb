require "message"

describe Message do
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
  
  let(:a_random_message) {double :message}
  it "should send the string sent in to the target phone" do
    expect(def send("We have your order")).to eq("We have your order")
  end
  end
  

end
