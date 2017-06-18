
require_relative "../lib/order"

describe Order do

  subject(:order) { described_class.new(printer) }
  let(:printer) { double(:printer) }

  describe "attributes" do
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

  describe "#summary" do
    before do
      allow(printer).to receive(:print_all_orders_in)
      allow(printer).to receive(:print_the)
    end
    it "asks the printer to print all orders in basket" do
      expect(printer).to receive(:print_all_orders_in).with(order.basket)
      order.summary
    end
    it "asks the printer to print the total" do
      expect(printer).to receive(:print_the).with(order.total)
      order.summary
    end
  end

end
