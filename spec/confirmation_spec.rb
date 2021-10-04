require_relative "../lib/confirmation.rb"

RSpec.describe Confirmation do
  let(:delivery_time) { (Time.now + 3600).strftime("%I:%M %p") }
  describe "#text" do
    it "Sends text stating order was placed successfully & will be delivered 1hr from now" do
      expect(subject.text).to eq "Thank you! Your order was placed and will be delivered before #{delivery_time}"
    end
  end
end
