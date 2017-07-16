require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new(orderdouble) }
    let(:orderdouble) { double(:order, order: nil) }
    let(:sampleorder) { 'Gimlet' }
    let(:errororder) { 'Banana' }
    let(:sampleamount) { 1 }

  describe "#menu" do
    it "responds to #menu method" do
      expect(takeaway).to respond_to(:menu)
    end
  end

  describe "#order" do
    it "delegates to the order object" do
      expect(orderdouble).to receive(:order)
      subject.order(sampleorder, sampleamount)
    end

    it "raises an error if item doesn't exist is menu" do
      expect { takeaway.order(errororder, sampleamount) }.to raise_error "Item unavailable"
    end
  end

  describe "#basket" do
    it "responds to #basket method" do
      expect(takeaway).to respond_to(:basket)
    end
  end

  describe "#checkout" do
    it "responds to #checkout method" do
      expect(takeaway).to respond_to(:checkout)
    end
  end
end
