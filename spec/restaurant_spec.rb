require 'restaurant'

describe Restaurant do
  let(:dish) { double("Chicken Burger") }
  describe "#add_to_order" do
    before(:example) do
      allow(dish).to receive(:name).and_return("Chicken Burger")
    end
    it "should add an order to the current order list with its qty" do
      dish_double = object_double(Dish.new("Chicken Nuggets", "3"))
      expect(dish_double).to receive(:update_qty).with(1)
      subject.add_to_order(dish_double, 1)
      expect(subject.current_order.length).to eq 1
    end
    it "should only change the quantity of an order if already in the current order" do
      dish_double = object_double(Dish.new("Chicken Nuggets", "3"))
      expect(dish_double).to receive(:update_qty).with(anything).twice
      subject.add_to_order(dish_double, 1)
      expect{ subject.add_to_order(dish_double, 2) }.to_not change { subject.current_order.length }
    end
  end
  describe "#review_order" do
    let(:dish2) { double("Fries") }
    before(:example) do
      allow(dish2).to receive(:name).and_return("Fries")
      allow(dish).to receive(:name).and_return("Chicken Burger")
      allow(dish2).to receive(:update_qty)
      allow(dish).to receive(:update_qty)
      allow(dish).to receive(:qty).and_return(1)
      allow(dish2).to receive(:qty).and_return(1)
      subject.add_to_order(dish, 1)
    end

    it "should show an order back to the user" do
      allow(dish).to receive(:price).and_return(5)
      expect { subject.review_order }.to output("Chicken Burger - 1 - Price: £5\ntotal £5\n").to_stdout
    end
    it "should show multiple orders back to the user" do
      allow(dish).to receive(:price).and_return(5)
      allow(dish2).to receive(:price).and_return(3)
      subject.add_to_order(dish2, 1)
      expect { subject.review_order }.to output("Chicken Burger - 1 - Price: £5\nFries - 1 - Price: £3\ntotal £8\n").to_stdout
    end
  end
  describe "#pay_order" do
    before(:example) do
      allow(dish).to receive(:price).and_return(5)
      allow(dish).to receive(:name).and_return("Chicken Burger", "Fries")
      allow(dish).to receive(:update_qty)
      allow(dish).to receive(:qty).and_return(1)
      subject.add_to_order(dish, 1)
    end
    it "should confirm order payment if paid amount matches required" do
      expect(subject.pay_order(5)).to eq "Your order has been confirmed! A text message will be sent shortly."
    end
    it "should say not enough money was received if paid amount is less than total" do
      expect { subject.pay_order(4) }.to raise_error("Sorry, this is not enough to cover the cost of the meal!")
    end
  end
end
