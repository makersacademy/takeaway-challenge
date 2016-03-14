require "order"

describe Order do
  burger = { "kiwiburger" => 9.35, "elderflower" => 2.35 }
  let(:menu) { double :menu, display: burger }
  subject(:order) { described_class.new(menu) }

  before do
    subject.add("kiwiburger", 2)
    subject.add("elderflower")
  end

  describe "#add" do
    it "should add a dish to the basket" do
      expect(subject.basket).to include("kiwiburger" => 2, "elderflower" => 1)
    end

    it "should raise error when dish is not available" do
      message = described_class::UNAVAIABLE_ERROR
      expect { subject.add("big mac") }.to raise_error message
    end
  end

  describe "#summary" do
    it "should return a list of ordered dishes with prices" do
      message = "kiwiburger x2 = £18.7, elderflower x1 = £2.35"
      expect(subject.summary).to eq message
    end
  end

  describe "#sum" do
    it "should calculate the total for the order" do
      expect(subject.sum).to eq 21.05
    end
  end
end
