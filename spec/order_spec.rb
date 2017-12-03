require 'order'

describe Order do

  describe "#initialize" do
    it "should initalize with an empty basket" do
      expect(subject.basket).to be_empty
    end

    it "should have a menu on the order" do
      expect(subject.menu).not_to be_nil
    end
  end

  describe "#add_order" do
    it "should add an item to the order" do
      subject.add_order("spring rolls")
      expect(subject.basket).to eq ["Spring Rolls"]
    end

    it "should add multiple items to the order" do
      subject.add_order("spring rolls")
      subject.add_order("bun thit nuong", 2)
      expect(subject.basket).to eq ["Spring Rolls", "Bun Thit Nuong", "Bun Thit Nuong"]
    end

    it "should raise error if the item is not on the menu" do
      expect { subject.add_order("Noodle Soup") }.to raise_error "This item is not on the menu"
    end
  end

  describe "#price" do
    it "should calculate price of the basket order" do
      subject.add_order("spring rolls")
      subject.add_order("bun thit nuong", 2)
      expect(subject.price).to eq 22.99
    end
  end

  describe "#basket_summary" do
    it "should give you your basket summary" do
      subject.add_order("spring rolls")
      subject.add_order("bun thit nuong", 2)
      expect(subject.basket_summary).to include "You have 3 item(s) in your basket:" && "Your total cost is: £22.99"
    end
  end

end
