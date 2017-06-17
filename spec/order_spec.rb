require "order"

describe Order do

  let (:order) { described_class.new }

  it { is_expected.to respond_to(:add_dish).with(2).arguments }
  it { is_expected.to respond_to(:basket) }

  describe "#initialise" do
    it "expects to initialize with an empty basket" do
      expect(order.basket).to eq []
    end
  end

  describe "#add_dish" do
    it "should add selected dish to basket" do
      order.add_dish("galbi", 1)
      expect(order.basket).to include {"galbi"}
    end
  end

end
