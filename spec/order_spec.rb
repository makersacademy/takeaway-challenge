require "order"

describe Order do
  subject(:order) { described_class.new(:menu)}
  let(:food) { double :food }

  let(:menu) { double :menu, show_menu: meals}
  let(:meals) { { "meal1" => 3.00, "meal2" => 2.00} }
  let(:meal1) { double (:meal1), :meal1 => 3.00 }
  let(:meal2) { double (:meal2), :meal2 => 2.00 }

  describe "add dishes" do
    it { is_expected.to respond_to(:add).with(1).argument }

    it "should add meal to the basket" do
      order.add(meal1)
      expect(order.basket).to eq [meal1]
    end
  end

  describe "calculate dishes" do
    it "should check if total matches the sum of dishes" do
      order.add("chicken")
      order.add("fish")
      expect(order.total_dishes).to eq(2)
    end
    # end
  end
end
