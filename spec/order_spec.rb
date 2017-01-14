require "order.rb"

describe Order do

  subject(:order)  { described_class.new }

  describe "#initialize" do
    it { is_expected.to respond_to(:dishes) }
    it "creates an empty dishes hash" do
      expect(order.dishes).to be_empty
    end
    it "sets order total to 0" do
      expect(order.total).to be_zero
    end
  end

  describe "#add_dish" do
    it { is_expected.to respond_to(:add_dish).with(2).arguments }
  end

end
