require 'takeaway'

describe Takeaway do
  let(:menu) { double :menu }
  before(:each) { allow(menu).to receive(:content).and_return({ chicken: 4, lamb: 7, vegetables: 3, latte: 2 }) }
  let(:takeaway) { Takeaway.new(menu) }


  describe "#place_order" do
    it "should return total costs of order" do
      expect(takeaway).to receive(:exact_sum)
      takeaway.place_order(:chicken, 2)
    end
  end

  describe "#exact_sum" do
    it "should return exact sum of orders" do
      takeaway.place_order(:chicken, 2)
      takeaway.place_order(:lamb, 2)
      expect(takeaway.exact_sum).to eq 22
    end
  end

  describe "#check" do
    it "should raise error if exact sum is not equal to total costs" do
      takeaway.place_order(:chicken, 2)
      expect { takeaway.check(50) }.to raise_error "Your order costs is incorrect"
    end

    it "should call the method successful when true" do
      takeaway.place_order(:chicken, 2)
      expect(takeaway).to receive(:successful).with(8)
      takeaway.check(8)
    end
  end

  describe "#successful" do
    it "should return twilio message on iPhone" do
      twilio = (double :twilio)
      allow(takeaway).to receive(:make_twilio) { twilio }
      takeaway.place_order(:chicken, 2)
      expect(twilio).to receive(:text_message).with(8)
      takeaway.check(8)
    end
  end

end