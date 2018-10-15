require 'nandos_menu'

describe NandosMenu do
  describe "#show_menu" do
    it "should display the menu" do
      expect(subject.show_menu).to eq "Quarter Chicken: £4\nHalf Chicken: £8\nWhole Chicken: £13\nChicken Wing: £1"
    end
  end

  describe "#price" do
    it "returns the price of a dish" do
      expect(subject.price("Half Chicken")).to eq 8
    end
  end
end
