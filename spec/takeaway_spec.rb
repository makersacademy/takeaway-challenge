require "takeaway"

describe Takeaway do
  describe "#initialze" do
    it "creates an array called menu on initalize" do
      expect(subject.menu).to eq []
    end
  end
end
