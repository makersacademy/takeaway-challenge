require 'order'

describe Order do

  context "#add_to_basket" do
    it "should add items to basket" do
      subject.add_to_basket("Hamburger", 2)
      expect(subject.basket).to include("Hamburger" => 2)
    end
    it "should not add items which aren't on menu" do
      expect { subject.add_to_basket("Chicken Korma", 4) }.to raise_error "Item not in menu"
    end
  end

  context "#order_summary" do
    it "should return total number of items" do
  #     subject.add_to_basket("Hamburger", 5)
  #     subject.add_to_basket("Pizza", 3)
  #     expect(subject.basket_total).to eq 8
    end
  end
end
