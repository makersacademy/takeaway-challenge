require "menu"

describe Menu do
  let(:subject) { described_class.new }
    
  describe "#show" do
    it "shows menu" do
      expect(subject.show).to eq subject.list
    end
  end
end