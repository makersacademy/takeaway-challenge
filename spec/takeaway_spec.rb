require "takeaway"

describe TakeAway do
  let(:dish_1) { double :dish, name: "Carbonara", price: 10 }
  let(:dish_2) { double :dish, name: "Puttanesca", price: 12 }
  let(:dish_3) { double :dish, name: "Bolognese", price: 11 }
  let(:menu) { double :menu, list: "Carbonara (£10), Puttanesca (£12)", contains?: true }
  let(:takeaway) { TakeAway.new(menu) }

  describe "#read_menu" do
    it "should list the menu" do
      expect(takeaway.read_menu).to eq "Carbonara (£10), Puttanesca (£12)"
    end
  end

  describe "#order" do
    it "should return a confirmation message that the given item has been added to the basket" do
      expect(takeaway.order(dish_1, 5)).to eq "5x Carbonara(s) added to your basket"
    end

    it "should raise an error is the dish is not in the menu" do
      allow(menu).to receive(:contains?).and_return(false)
      expect { takeaway.order(dish_3, 4) }.to raise_error "This dish is not in the menu"
    end
  end

  describe "#basket_summary" do
    it "should return the basket summary" do
      takeaway.order(dish_1, 5)
      takeaway.order(dish_2, 2)
      expect(takeaway.basket_summary).to eq "Carbonara x5 = £50, Puttanesca x2 = £24"
    end
  end

  describe "#total" do
    it "should return the total cost of the takeaway" do
      takeaway.order(dish_1, 5)
      takeaway.order(dish_2, 2)
      expect(takeaway.total).to eq "Total: £74"
    end
  end

  describe "#correct_amount?" do
    it "should return 'true' if the given price matches the total cost of the takeaway" do
      takeaway.order(dish_1, 5)
      takeaway.order(dish_2, 2)
      expect(takeaway.correct_amount?(74)).to eq true
    end

    it "should return 'false' if the given price matches the total cost of the takeaway" do
      takeaway.order(dish_1, 5)
      takeaway.order(dish_2, 2)
      expect(takeaway.correct_amount?(20)).to eq false
    end
  end

  describe "#empty?" do
    it "should return 'true' if the basket is empty" do
      expect(takeaway.empty?).to eq true
    end

    it "should return 'false' if the basket is not empty" do
      takeaway.order(dish_1)
      expect(takeaway.empty?).to eq false
    end
  end

  describe "#complete" do
    it "should return 'Thank you for your order'" do
      takeaway.order(dish_1)
      expect(takeaway.complete).to eq "Thank you for your order"
    end
  end
end
