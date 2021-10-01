# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

require "menu"

describe Menu do
  describe "#menu" do
    it "has a list of dishes with prices" do
      expect(subject.menu).to include(curried_goat: 7.50)
    end
  end
  describe "#show_menu" do
    it "displays the menu" do
      expect(subject.show_menu).to eq curried_goat: 7.50,
        fried_chicken: 6.50,
        fried_snapper: 7.00,
        ackee_with_sweet_peppers: 6.00,
        fried_plantain: 2.00,
        mac_and_cheese: 4.00,
        rice_and_peas: 3.00,
        plain_rice: 2.50
    end
  end
end
