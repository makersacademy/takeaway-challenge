require 'takeaway'

describe Takeaway do

  let(:text) { double(:text, send: nil) }

  let(:menu) { double(:menu, show: nil, available?: true,
    dishes: [{ name: "Big Mac", price: "3.19" },
            { name: "Quarter Pounder", price: "3.19" },
            { name: "McChicken", price: "3.00" },
            { name: "Cheeseburger", price: "0.99" },
            { name: "Hamburger", price: "0.89" },
            { name: "French Fries", price: "1.09" }])
  }

  subject(:takeaway) { Takeaway.new(menu, text) }

  # I don't think this test does anything
  describe "#show_menu" do
    it "should show the menu" do
      expect { menu.show }.to_not raise_error
    end
  end

  describe "#order" do

    it "should add an item to the basket" do
      takeaway.order("McChicken")
      message = "Order is as follows:\nMcChicken x1"

      expect { takeaway.see_order }.to output("#{message}\n").to_stdout
    end

    it "should add multiple items to the basket" do
      takeaway.order("McChicken")
      takeaway.order("French Fries", 2)
      message = "Order is as follows:\nMcChicken x1\nFrench Fries x2"

      expect { takeaway.see_order }.to output("#{message}\n").to_stdout
    end

    it "should not accept unknown items" do
      allow(menu).to receive(:available?).and_return(false)

      expect { takeaway.order("unknown") }.to raise_error("That dish is not on the menu")
    end

    it "should tell the user what they added to the basket" do
      expect(takeaway.order("McChicken", 2)).to eq "2x McChicken added to the basket"
    end

  end

  describe "#checkout" do

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
      expect { takeaway.checkout(4.06) }.to_not raise_error
    end

  end

end
