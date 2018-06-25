require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new }
  let(:dish) { double :dish }

  describe "#add_order" do
    it { is_expected.to respond_to(:add_order).with(2).argument }
    it "should add dishes and quantity to @item after order" do
      order.add_order(:dish, 1)
      expect(order.item).to eq({ :dish => 1 })
    end
  end

  describe "#order_total" do
    it "should return all previous order" do
      order.add_order(:dish, 1)
      expect(order.total_order).to eq([{ :dish => 1 }])
    end
  end

  describe "#total_price" do
    it "should return the sum of order" do
      order.add_order("spring roll", 2)
      order.backet_summary
      expect(order.total_price).to eq 1.98
    end
  end
end
