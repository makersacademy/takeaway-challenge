require 'takeaway'

describe Takeaway do

  let(:menu) { double(:menu, show: nil, available?: true,
    dishes: [{ name: "Big Mac", price: "3.19" },
            { name: "Quarter Pounder", price: "3.19" },
            { name: "McChicken", price: "3.00" },
            { name: "Cheeseburger", price: "0.99" },
            { name: "Hamburger", price: "0.89" },
            { name: "French Fries", price: "1.09" }])
  }

  subject(:takeaway) { Takeaway.new(menu) }

  # I don't think this test does anything
  describe "#show_menu" do
    it "should show the menu" do
      expect { menu.show }.to_not raise_error
    end
  end

  describe "#order" do

    it "should add an item to the basket" do
      takeaway.order("McChicken")

      expect(takeaway.basket).to include "McChicken"
    end

    it "should add multiple items to the basket" do
      takeaway.order("McChicken", 4)

      expect(takeaway.basket["McChicken"]).to eq 4
    end

    it "should not accept unknown items" do
      allow(menu).to receive(:available?).and_return(false)

      expect { takeaway.order("unknown") }.to raise_error("That dish is not on the menu")
    end

  end

end
