require "text_message"

describe TextMessage do
  let(:textMessage) { double }
  context "dummy call to text method" do
    it "send a text message" do
      allow(textMessage).to receive(:send_text).and_return(true)
      expect(textMessage.send_text()).to eq(true)
    end
  end

  xcontext "actual call to text method" do
    it "send a text message" do
      in_one_hour = Time.now + 3600
      time = in_one_hour.strftime("%H:%M")
      text_msg = "Thank you! Your order was placed and will be delivered before #{time}"
      expect(subject.send_text(text_msg)).to eq(true)
    end
  end
end
