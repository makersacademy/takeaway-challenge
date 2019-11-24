require "text_provider"

describe TextProvider do
  let(:time_formatter) { double :time_formatter, delivery_time: "18:55" }
  let(:text_provider) { TextProvider.new(time_formatter) }

  describe "#send_message" do
    it "should return a text saying that the order was placed successfully and it will be delivered 1 hour from now" do
      message = "Thank you! Your order was placed and will be delivered before 18:55"
      expect(text_provider.send_message).to eq message
    end
  end
end
