require "order"

describe Order do

  let(:dish) { double :dish }
  let(:menu) { double :menu, include?: true }
  let(:order) { Order.new(menu) }

  describe "#select" do

    it "should raise an error if the dish is already in the order" do
      order.select(dish, 5)
      expect { order.select(dish, 2) }.to raise_error "This dish has already been ordered"
    end

  end

end
