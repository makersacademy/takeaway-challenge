require 'menu'

describe Menu do
  describe "#show_menu" do
    it "should display the menu" do
      expect(subject.show_menu).to eq "Quarter Chicken: £4\nHalf Chicken: £8\nWhole Chicken: £13\nChicken Wing: £1"
    end
  end
end
