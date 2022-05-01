require 'order'

describe Order do
  describe "#select_dish" do
    it "selects a dish from the menu" do
      expect(subject).to respond_to(:choose_dish).with(1).argument
    end

    it "initializes with an empty order list" do
      expect(subject.basket).to be_empty
    end

    it "adds a dish to the basket" do
      subject.choose_dish("meatball sub")
      expect(subject.basket).to include "meatball sub"
    end
  end

  describe "#total" do
    it "calculates total sum of order" do
      subject.choose_dish("meatball sub")
      expect(subject.total).to eq "Your basket's total is £5."
    end
  end

  describe "#check_basket" do
    it "shows what's in the basket" do
      expect(subject.check_basket).to eq ([])
    end
  end

end
