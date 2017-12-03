require 'takeaway'

describe Takeaway do
  let(:menu) { double(:menu, "Popadums" => 1, to_s: "Lamb Biryani, £4.99\nChicken Malaya, £4.50\nPopadums, £1.00") }
  let(:order_class) {double(:order_class, new: order )}
  let(:order) {double(:order, price: 10.49, check: true)}
  let(:texter_class) {double(:texter_class, new: texter)}
  let(:texter) {double(:texter, text: nil)}
  subject {described_class.new(menu, order_class, texter_class)}
  before do
    subject.twilio_init("01","01","01234987654")
  end
  describe "#menu" do
    it "should return a list of Dishes as strings" do
      expect(subject.menu).to eq "Lamb Biryani, £4.99\nChicken Malaya, £4.50\nPopadums, £1.00"
    end
  end
  describe "#order" do
    it "should be able to accept a number of dishes as a hash" do
      expect{subject.order({"Lamb Biryani" => 1, "Chicken Malaya" =>1, "Popadums" => 1}, 10.49, "07123456789")}.not_to raise_error
    end
    it "should check that the order price is equal to the price given and raise an error if not" do
      expect{subject.order({"Lamb Biryani" => 1, "Chicken Malaya" =>1, "Popadums" => 1}, 6.99,"07123456789")}.to raise_error "Price Mismatch!"
    end
    it "should use the Texter to text the customer" do
      expect(texter).to receive("text").with("07123456789")
      subject.order({"Lamb Biryani" => 1, "Chicken Malaya" =>1, "Popadums" => 1}, 10.49, "07123456789")
    end
  end
end
