
require_relative "../lib/order"

describe Order do

  subject(:order) { described_class.new(order_printer) }
  let(:order_printer) { double(:order_printer) }

  describe "attributes" do
    it { is_expected.to respond_to(:printer) }
    it { is_expected.to respond_to(:total) }
    it { is_expected.to respond_to(:basket) }
  end

  describe "#add" do
    it "adds a dish to the order basket" do
      dish = :Pizza
      expect { order.add(dish) }.to change { order.basket }.from({}).to({ dish => 1 })
    end
    it "adds the dish's price to the order's total" do
      dish = :Pizza
      expect { order.add(dish) }.to change { order.total }.from(order.total).to(order.total + 10.0)
    end
  end

end
