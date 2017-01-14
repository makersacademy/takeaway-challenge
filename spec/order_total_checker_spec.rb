require "order_total_checker.rb"

describe OrderTotalChecker do

  subject(:ordertotalchecker) { described_class }
  let(:order) { instance_double("Order") }
  let(:pepperoni) { instance_double("Dish") }
  let(:hawaiian) { instance_double("Dish") }
  let(:meat_feast) { instance_double("Dish") }


  describe "#check_total" do
    it { is_expected.to respond_to(:check_total).with(1).argument }
    it "returns true if expected_order_total is correct" do
      allow(pepperoni).to receive(:price) { 5 }
      allow(hawaiian).to receive(:price) { 10 }
      allow(meat_feast).to receive(:price) { 15 }
      allow(order).to receive(:ordered_dishes) { { pepperoni => 3, hawaiian => 2, meat_feast => 4 } }
      allow(order).to receive(:expected_order_total) { 95 }
      expect(ordertotalchecker.check_total(order)).to be true
    end
  end

end
