require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  before(:each) { allow(menu).to receive(:content).and_return({ chicken: 4, lamb: 7}) }
  subject { Takeaway.new(menu) }

  describe "#place_order" do
    it "should return total costs of order" do
      expect(subject).to receive(:exact_sum)
      subject.place_order(:chicken, 2)
    end

    it "should raise error if dish is not on the menu" do
      expect { subject.place_order(:spaghetti, 2) }.to raise_error "Sorry, that dish is not on the menu."
    end
  end

  describe "#exact_sum" do
    it "should return exact sum of orders" do
      subject.place_order(:chicken, 2)
      subject.place_order(:lamb, 2)
      expect(subject.exact_sum).to eq 22
    end
  end

  describe "#check" do
    it "should raise error if exact sum is not equal to total costs" do
      subject.place_order(:chicken, 2)
      expect { subject.check(50) }.to raise_error "Your order costs is incorrect"
    end

    it "should call the method successful when true" do
      subject.place_order(:chicken, 2)
      expect(subject).to receive(:processing_order).with(8)
      subject.check(8)
    end
  end

  describe "#processing_order" do
    it "should return twilio message on iPhone" do
      twilio = (double :twilio)
      allow(subject).to receive(:api) { twilio }
      subject.place_order(:chicken, 2)
      expect(twilio).to receive(:text_message).with(8)
      subject.check(8)
    end
  end

end