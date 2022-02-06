require "text"

describe Text do

  let(:textMessage) { double }

  describe "it will successfully initiate a dummy call to send SMS" do

    it "will send an SMS" do
      allow(text).to receive(:send_text).and_return(true)
      expect(text.send_text()).to eq(true)
    end

  end

  describe "it will successfully initiate an actual call to send SMS" do

    it "will send a text message" do
      time = Time.now + (60 * 60)
      text_msg = "Thank you! Your order was placed and will be delivered before #{time}. The cost of your order to be paid on delivery is £#{@total}"
      expect(subject.send_text(text_msg)).to eq(true)
    end
  end
end