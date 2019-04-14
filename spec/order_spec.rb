require 'order'

describe Order do

  subject(:order) { described_class.new }

  describe "#print" do
    it "the menu" do
      expect(order).to respond_to(:print)
    end
  end

  describe '#select' do
    it "selects a dish" do
      expect(order).to respond_to(:select).with(1).argument
    end

    it "adds a dish to the basket" do
      dish = "lamb"
      expect { order.select(dish) }.to change { order.basket.length }.from(0).to(1)
    end
  end

  describe "#print_order" do
    it "shows what is in the basket" do
      order.select("lamb")
      expect(order.print_order).to include "lamb"
    end

    it "shows each individual price" do
      order.select("lamb")
      expect(order.print_order).to include "6"
    end

    it "shows the total" do
      order.select("lamb")
      total = order.total
      expect(order.print_order).to include "#{total}"
    end
  end

end
