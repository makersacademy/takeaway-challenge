require "takeaway"

describe Takeaway do
  subject(:takeaway) { described_class.new }

  describe "#menu" do
    it "responds to #menu method" do
      expect(takeaway).to respond_to(:menu)
    end
  end

  describe "#order" do
    it "responds to #order method" do
      expect(takeaway).to respond_to(:order)
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
