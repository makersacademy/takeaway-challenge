 require 'phone'

 describe Phone do

   time = Time.now + 3600
   message = "Thank you! Your order was placed and will be delivered before #{time}"
   let(:order) { double :menu  }

  describe "#send_message" do
    it "sends confirmation message to user's phone" do
      allow(subject). to receive(:send_message) {message}
      expect(subject.send_message(order)).to eq(message)
    end
  end

end
