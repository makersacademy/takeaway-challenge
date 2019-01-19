require 'print'

RSpec.describe Print do
  describe "#display" do
    it "returns the input" do
      expect(subject.display("Hello")).to eq("Hello")
    end
  end
end
