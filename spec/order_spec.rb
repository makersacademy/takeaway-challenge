require 'order'

describe Order do
  let(:order) { Order.new }
  let(:dish) { double(:dish) }

  describe "#add" do
    it "adds an item to the order" do
      expect(order.add(dish)).to include(dish)
    end

    it "can add multiple items to the order" do
      order.add(dish, 3)
      expect(order::choice).to eq([dish, dish, dish])
    end
  end
end
