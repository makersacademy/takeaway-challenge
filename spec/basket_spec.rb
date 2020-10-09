require 'basket'

describe Basket do
  let(:menu) { double :menu, items: { "Blini" => 7 }, print_menu: "Blini, £7" }

  describe "#initialize" do
    it "has an empty items array" do
      expect(subject.items).to be_empty
    end

    it "keeps a total that is 0 by default" do
      expect(subject.total).to eq 0
    end
  end

  describe "#add" do
    it "adds an item to the items array" do
      subject.add_item("Blini")
      expect(subject.items).to include("Blini")
    end
  end
end
