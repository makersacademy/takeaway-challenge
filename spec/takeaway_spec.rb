require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new }
    let(:order) { double(:order) }
    let(:menu) { @menu }

  describe "#menu" do
    it "responds to #menu method" do
      expect(takeaway).to respond_to(:menu)
    end
  end

  describe "#order" do
    it "delegates to the order object" do
      expect(order).to receive(:order)
      subject.order(order)
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
