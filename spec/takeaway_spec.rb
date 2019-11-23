require "takeaway"

describe Takeaway do
  describe "#initialze" do
    it "creates an array called menu on initalize" do
      expect(Takeaway.new.menu).to be_a(Hash)
    end
  end
end
