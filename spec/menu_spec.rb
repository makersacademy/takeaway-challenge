require 'menu'

describe Menu do

  describe "#view" do
    it "returns @items" do
      expect(subject.view).to eq subject.items
      expect do
        subject.view
      end.to output("spring rolls....£1.99\n").to_stdout
    end
  end

  describe "#price" do
    it { is_expected.to respond_to(:price).with(1).argument }

    it "returns price when given an argument" do
      expect(subject.price("spring rolls")).to eq 1.99
    end
  end

  describe "on_menu?" do
    it "returns true if an item is on the menu" do
      expect(subject.on_menu?("spring rolls")).to eq true
    end

    it "returns false if an item isn't on the menu" do
      expect(subject.on_menu?("pizza")).to eq false
    end

  end

end
