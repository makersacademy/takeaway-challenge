require 'text'

describe Text do

  let(:text){instance_double("Text")}

    str = "Thank you! Your order came to £10. "\
    "You can expect your delivery at #{(Time.new + 3600).strftime('%I:%M%P')}"

  describe "#send_message" do
    it "sends a confirmation text" do
      allow(text).to receive(:send_message)
      allow(text).to receive(:message)
      allow(text).to receive(:generate_message)
      expect(text.send_message).to eq(text.message)
    end
    it "has the correct price in the text" do
      allow(text).to receive(:generate_message)
      allow(text).to receive(:send_message){10}
      allow(text).to receive(:message)
      expect(text.send_message).to eq(10)
    end
  end
end
