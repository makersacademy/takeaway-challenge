require 'restaurant'

describe Restaurant do
  let(:dish) { double("Chicken Burger") }
  describe "#add_to_order" do
    before(:example) do
      allow(dish).to receive(:name).and_return("Chicken Burger")
    end
    it "should add an order to the current order list" do
      subject.add_to_order(dish)
      expect(subject.current_order.length).to eq 1
    end
  end
  describe "#review_order" do
    before(:example) do
      allow(dish).to receive(:name).and_return("Chicken Burger", "Fries")
      subject.add_to_order(dish)
    end

    it "should show an order back to the user" do
      expect(subject.review_order).to eq "Chicken Burger"
    end
    it "should show multiple orders back to the user" do
      subject.add_to_order(dish)
      expect(subject.review_order).to eq "Chicken Burger, Fries"
    end
  end
  describe "#pay_order" do
    before(:example) do
      allow(dish).to receive(:price).and_return(5)
      allow(dish).to receive(:name).and_return("Chicken Burger", "Fries")
      subject.add_to_order(dish)
    end
    it "should confirm order payment if paid amount matches required" do
      expect(subject.pay_order(5)).to eq "Your order has been confirmed! A text message will be sent shortly."
    end
    it "should say not enough money was received if paid amount is less than total" do
      expect { subject.pay_order(4) }.to raise_error("Sorry, this is not enough to cover the cost of the meal!")
    end
  end
end
