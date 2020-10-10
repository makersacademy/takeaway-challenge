require 'basket'

describe Basket do
  subject(:subject) { described_class.new(menu) }
  let(:menu) { double :menu, items: { "Blini" => 7 }, print_menu: "Blini, £7" }

  describe "#initialize" do
    it "has an empty items array" do
      expect(subject.items).to be_empty
    end

    it "keeps a total that is 0 by default" do
      expect(subject.total).to eq 0
    end
  end

  describe "#add_item" do
    before do
      subject.add_item("Blini")
    end

    it "adds an item to the items array" do
      expect(subject.items).to include("Blini")
    end

    it "adds price of an item to total" do
      expect(subject.total).to eq 7
    end

    it "raises error if item doesn't exist" do
      expect { subject.add_item("Burger") }.to raise_error("This item doesn't exist!")
    end
  end

  describe "#show" do
    it 'shows the basket' do
      subject.add_item("Blini")
      expect { subject.show }.to output.to_stdout
    end

    it 'raises error if basket empty' do
      expect { subject.show }.to raise_error("Your basket is empty.")
    end
  end

  describe "#clear" do
    it "clears the basket" do
      subject.add_item("Blini")
      subject.clear
      expect(subject.items).to be_empty
    end
  end

  describe "#empty?" do
    it "returns true when basket empty" do
      expect(subject.empty?).to eq true
    end

    it "returns false when basket not empty" do
      subject.add_item("Blini")
      expect(subject.empty?).to eq false
    end
  end
end
