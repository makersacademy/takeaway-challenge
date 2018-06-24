require "order"

describe Order do

  describe "add dishes" do
    it { is_expected.to respond_to(:add).with(1).argument }

    subject(:order) { described_class.new }
    let(:food) { double :food }

    it "should add food to the basket" do
      order.add(food)
      expect(order.basket).to eq [food]
    end
  end
end
