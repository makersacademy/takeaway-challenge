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

  describe "#checkout" do
    let(:time) { Time.now.strftime("%H:%M") }

    before(:each) do
      takeaway.order("Cheeseburger")
      takeaway.order("Hamburger")
      takeaway.order("French Fries", 2)
      sum = 0.99 + 0.89 + 1.09 * 2 # 4.06
      allow(menu).to receive(:sum).and_return(sum.round(2))
    end

    it "should raise an error if the user sum is not correct" do
      expect { takeaway.checkout(3) }.to raise_error("That is not the right price of the order, please try again")
    end

    it "should complete the order" do
      expect(takeaway.checkout(4.06)).to eq("Thank you! Your order was placed and will be delivered before #{time}")
    end

  end

end
