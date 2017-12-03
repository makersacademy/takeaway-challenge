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

  describe "#add_item" do
    it "should add an item to the order" do
      subject.add_item("spring rolls")
      expect(subject.basket).to eq [{ :item => "Spring Rolls", :quantity => 1 }]
    end

    it "should add multiple items to the order" do
      subject.add_item("spring rolls")
      subject.add_item("bun thit nuong", 2)
      expect(subject.basket).to eq [{ :item => "Spring Rolls", :quantity => 1 }, { :item => "Bun Thit Nuong", :quantity => 2 }]
    end

    it "should raise error if the item is not on the menu" do
      expect { subject.add_item("Noodle Soup") }.to raise_error "This item is not on the menu"
    end
  end

  describe "#delete_item" do
    it "should let you delete an item" do
      subject.add_item("spring rolls")
      subject.add_item("bun thit nuong", 2)
      subject.delete_item("bun thit nuong", 2)
      expect(subject.basket).to eq [{ :item => "Spring Rolls", :quantity => 1 }]
    end
  end

  describe "#price" do
    it "should calculate price of the basket order" do
      subject.add_item("spring rolls")
      subject.add_item("bun thit nuong", 2)
      subject.add_item("pho", 3)
      expect(subject.price).to eq 55.96
    end
  end

  describe "#basket_summary" do
    it "should give you your basket summary" do
      subject.add_item("spring rolls")
      subject.add_item("bun thit nuong", 2)
      subject.add_item("pho", 3)
      expect(subject.basket_summary).to include "You have 3 item(s) in your basket:" && "Your total cost is: £55.96"
    end

    it "should give you the correct summary when item is deleted off the basket" do
      subject.add_item("spring rolls")
      subject.add_item("bun thit nuong", 2)
      subject.delete_item("bun thit nuong", 2)
      expect(subject.basket_summary).to include "You have 1 item(s) in your basket:" && "Your total cost is: £3.99"
    end
  end

end
