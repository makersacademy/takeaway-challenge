require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe '#select' do
    it "selects a dish" do
      expect(order).to respond_to(:select).with(1).argument
    end

    it "adds a dish to the basket" do
      dish = "lamb"
      expect { order.select(dish) }.to change { order.basket.length }.from(0).to(1)
    end
  end

  describe "#print" do
    it "the basket" do
      order.select("lamb")
      expect(order.print).to include "lamb"
    end

    it "individual prices" do
      order.select("lamb")
      expect(order.print).to include "6"
    end

    it "the total sum" do
      order.select("lamb")
      total = 6
      expect(order.print).to include "#{total}"
    end
  end

end
