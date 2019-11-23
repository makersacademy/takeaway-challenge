require "order"

describe Order do

  let(:dish)   { double :dish }
  let(:order)  { Order.new(menu) }

  describe "#select" do

    context "when the dish is in the menu" do
      let(:menu) { double :menu, include?: true }

      it "should raise an error if the dish is already in the order" do
        order.select(dish, 5)
        expect { order.select(dish, 2) }.to raise_error "This dish has already been ordered"
      end

    end

    context "when the dish is not in the menu" do
      let(:menu) { double :menu, include?: false }

      it "should raise an error" do
        expect { order.select(dish, 2) }.to raise_error "This dish is not in the menu"
      end

    end

  end

  describe "#place" do
    let(:menu) { double :menu, include?: true }

    it "should raise an error if the total does not match the sum of the various dishes" do
      order.select(dish, 5)
      expect { order.place(10) }.to raise_error "The total does not match the sum of the various dishes"
    end

  end

end
