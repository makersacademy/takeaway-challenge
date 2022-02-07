require_relative '../lib/restaurant'

describe Restaurant do
  describe "#show_menu" do
    it "lists the dishes and their prices" do
      expect(subject.show_menu).to eq{menu}
    end
  end

  describe "#select_dish" do
    it "allows the customer to select a dish from the menu" do
      subject.show_menu
      expect(subject).to respond_to :select_dish
    end
  end
end
