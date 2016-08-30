require "takeaway"
require "menu"

describe Takeaway do
  let(:menu) { ("Celery Cupcakes, 2.95, Lacto-Free Milk, 1.95, Fat-Free Butter, 3.5") }

  describe "#show_menu" do

    it "shows the menu" do
      expect(subject.menu).to eq menu
    end
  end

  describe "#total" do

    it "should return a number as the basket total price" do
      expect(subject.total).to be_an Integer
    end
  end

  describe "#checkout" do

    it "should raise an error if there's nothing to check out" do
      expect(subject.checkout).to raise_error"You have not added any items to your basket"
    end
  end



  describe "#order" do

    it "returns the basket items" do
      subject.order("Celery Cupcake", 2)
      expect(subject.basket).to eq(["Celery Cupcake", "Celery Cupcake"])
    end
  end
end
