require 'order'
require 'menu'

describe Order do

  subject(:order) { described_class.new }

  describe "#view_menu" do
    it { is_expected.to respond_to(:view_menu) }

    it "displays the menu" do
      expect { order.view_menu }.to output { /burger 10.0/ }.to_stdout
    end
  end

  describe "#add" do
    it { is_expected.to respond_to(:add).with(2).arguments }

    it "raises error if dish not available" do
      expect { order.add("pizza", 1) }.to raise_error "Dish not available. Please try again."
    end

    it "raises error if no quantity provided" do
      expect { order.add("burger", "1") }.to raise_error "Quantity not provided. Please try again."
    end

    it "adds the dish and quantities to the order" do
      order.add("burger", 2)
      expect(order.dishes).to eq [{ dish: "burger", quantity: 2 }]
    end
  end
end
