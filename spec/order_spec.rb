require 'order'

describe Order do
  describe "#initialize" do
    it "initializes with a total of 0" do
      expect(subject.total).to eq(0)
    end
  end
end
