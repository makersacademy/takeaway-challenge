require 'takeaway'

describe Takeaway do

let(:dish){Dishes.new("Sandwich", 3)}
# let(:frozen_time){Time.now("14:24")}

  it "returns an empty list" do
    expect(subject.collect).to eq []
  end

  describe "#add_order" do
    it "adds price and quantity of the dish" do
      subject.add_order(dish, 1)
      expect(subject.collect).to eq [3]
    end
  end

  describe "#total_price" do
    it "returns the total of the amount to pay" do
      subject.add_order(dish, 2)
      expect(subject.total_price).to eq 6
    end
  end

  describe "#checkout" do
    it "returns an error if the amount is not correct" do
      subject.add_order(dish, 1)
      expect(subject.checkout(10)).to eq "Sorry your amount is not correct"
    end

    it "confirms the order" do
      subject.add_order(dish, 2)
      expect(subject.checkout(6)).to eq "Your order has been accepted, your meal will be with you at #{(Time.now + 60 * 60).strftime('%H:%M')}"
    end
  end
end
