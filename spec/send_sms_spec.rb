require "send_sms"

describe Text do

  let(:textMessage) { double }

  describe "it will successfully initiate a dummy call to send SMS" do

    it "will send an SMS" do
      allow(textMessage).to receive(:send_text).and_return(true)
      expect(textMessage.send_text()).to eq(true)
    end

  end

  # This test is xit so that it does not actually send when testing
  describe "it will successfully initiate an actual call to send SMS" do

    xit "will send a text message" do
      time_plus_one_hour = Time.now + 3600
      time = time_plus_one_hour.strftime("%H:%M")
      text_msg = "Thank you! Your order was placed and will be delivered before #{time}."
      expect(subject.send_text(text_msg)).to eq(true)
    end
  end
end
