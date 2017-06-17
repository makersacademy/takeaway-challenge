require "order"

describe Order do

  let (:order) { described_class.new }

  it { is_expected.to respond_to(:add_dish).with(2).arguments }
  it { is_expected.to respond_to(:basket) }
  it { is_expected.to respond_to(:total) }

  describe "#initialise" do
    it "expects to initialize with an empty basket" do
      expect(order.basket).to eq Hash.new
    end
  end

  describe "#add_dish" do
    it "should add selected dish to basket" do
      order.add_dish("galbi", 1)
      expect(order.basket).to include {:galbi}
    end

    it "should raise error if dish is not on menu" do
      expect { order.add_dish("fish", 1) }.to raise_error("Dish not available. Please see menu for options.")
    end
  end

  describe "#total" do
    it "should return the total cost of items in basket" do
      order.add_dish("galbi", 1)
      expect(order.total).to eq "Your order total is £10.99"
    end
  end

  describe "#checkout" do
    before do
      $stdin = StringIO.new("Yes")
    end

    after do
      $stdin = STDIN
    end

    it "should return confirmation message if 'Yes' response" do
      expect(order.checkout).to include "Thankyou! Your order was placed and will be delivered"
    end
  end
end
