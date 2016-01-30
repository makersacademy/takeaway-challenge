require "takeaway"

describe Takeaway do

  TEST_MENU = { "Won Ton" => 3.70,
                "Chicken and Noodle Soup" => 1.90,
                "Pork Chow Mein" => 4.60,
              }

  subject(:takeaway){described_class.new(menu: TEST_MENU)}

#has a read_menu
#has a basket
#can return a dynamic delivery message

  describe "before order" do

    it "returns an item and its price" do
      expect(takeaway.read_menu).not_to be_empty
    end

    it "starts with an empty basket" do
      expect(takeaway.basket_summary).to be_empty
    end
  end

  describe "adds menu items to basket" do

    before do
      takeaway.order("Won Ton")
    end

    it "adds an item" do
      expect(takeaway.basket_summary).to include("Won Ton")
    end

    context "invalid order"

      it "raises an error if item is invalid" do
        expect do
          takeaway.order("Mozarella and Basil Pasta")
        end.to raise_error "This item isn't on the menu."
      end

  end
  # context "removes menu items"
  # context "places an order"
end