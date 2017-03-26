require 'takeaway'

describe Takeaway do
  subject(:takeaway) { described_class = Takeaway.new }

  describe "#read_menu" do
    it "So that I can check if I want to order something, check read_menu returns the dishes" do
      dishes = {"Pizza"=>8.00, "Nachos"=>6.00, "Beer"=>3.00}
        expect(takeaway.read_menu).to eq dishes
      end
    end

    describe "#order" do
    it "So that I can order the meal I want, check order returns confirmation message" do
      expect(takeaway.order("Pizza", 1)).to eq "1x Pizza(s) added to your basket."
      end
    end

    describe "#basket_summary" do
      it "So that I can order the meal I want, check basket_summary returns my orders" do
        takeaway.order("Pizza", 3)
        expect(takeaway.basket_summary).to eq ["3x Pizza(s), Unit price: 8.0, Total price: 24.0"]
      end
    end

    describe "#total" do
      it "So that I can order the meal I want, returns the total cost" do
        takeaway.order("Pizza", 3)
        takeaway.order("Nachos", 4)
        expect(takeaway.total).to eq "Your total order is: £48.0"
      end
    end

    describe "#checkout" do
      it "So that I can pay for my order, check that total is 0 after completed payment" do
        takeaway.order("Pizza", 3)
        takeaway.checkout(24.0)
        expect(takeaway.total).to eq "Your total order is: £0"
      end
    end
  end
