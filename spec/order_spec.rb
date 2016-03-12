require "order"

describe Order do

  let(:menu) { double :menu, display: { "kiwiburger" => 9.35, "elderflower" => 2.35 } }
  subject(:order) { described_class.new(menu) }

  describe "#add" do
    it "should add a dish to the basket" do
      subject.add("kiwiburger", 2)
      expect(subject.basket).to include("kiwiburger" => 2)
    end

    it "should raise error when dish is not available" do
      message = described_class::UNAVAIABLE_ERROR
      expect { subject.add("big mac") }.to raise_error message
    end
  end

  describe "#confirm_addition" do
    it "should confirm the item and quantity added to the basket" do
      subject.add("kiwiburger", 3)
      message = "3x kiwiburger(s) added to your basket."
      expect(subject.confirm_addition).to eq message
    end
  end

  describe "#summary" do
    it "should return a list of ordered dishes with prices" do
      subject.add("kiwiburger", 2)
      subject.add("elderflower")
      message = "kiwiburger x2 = £18.70, elderflower x1 = £2.35"
      expect(subject.summary).to eq message
    end
  end

  describe "#sum" do
    it "should calculate the total for the order" do
      subject.add("kiwiburger", 2)
      subject.add("elderflower")
      expect(subject.sum).to eq 21.05
    end
  end
end
