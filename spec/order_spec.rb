require 'order'

describe Order do

  context "#initialize" do
    it "has an empty order array" do
      expect(subject.basket).to eq([])
    end

    it "has a bill of 0" do
      expect(subject.total).to eq 0
    end
  end

  context "adding items" do

    it "raises an error if person tries to order item not on menu" do
      expect { subject.add("foie gras") }.to raise_error("Dish not on menu")
    end

    it "adds items to the user's basket" do
      subject.add("Burger", 1)
      expect(subject.basket).to eq [{:dish=>"Burger", :price=>9}]
    end

    it "lets user add several items to their order" do
      subject.add("Burger", 5)
      expect(subject.basket.length).to eq 5
    end

    it "adds items to user's bill" do
      subject.add("Burger", 5)
      expect(subject.total).to eq 45
    end
  end

  context "checkout" do
    it "tell user if basket is empty" do
      expect { subject.checkout }.to output("Your basket is empty").to_stdout
    end
  end

  context "paying" do
    it "doesn't let customer pay wrong amount" do
      subject.add("Burger", 5)
      expect{ subject.pay(20) }.to raise_error(StandardError)
    end

    # Need a test for sending the text message
  end
end
