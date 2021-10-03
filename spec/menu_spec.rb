require 'menu'

describe Menu do
  describe "#display-menu" do
    subject = described_class.new
    it "outputs the restaurant menu" do
      expect(subject.display).to be_a Array
    end
  end
end
