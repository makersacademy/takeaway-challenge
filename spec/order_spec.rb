require "order"

describe Order do

  let(:menu) { double :menu, display: { "skinny fries" => 2.95 } }
  subject(:order) { described_class.new(menu) }

  describe "#order" do
    it "should add a dish to the basket" do
      subject.add("skinny fries", 2)
      expect(subject.basket).to include("skinny fries" => 2)
    end

    it "should raise error when dish is not available" do
      message = described_class::UNAVAIABLE_ERROR
      expect { subject.add("chunky fries") }.to raise_error message
    end
  end


end
