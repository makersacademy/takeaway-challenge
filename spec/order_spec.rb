require "order"
require "restaurant"

describe Order do
  subject(:order) { described_class.new(available_dishes) }

  describe "#add" do
    let(:error_message) {  "Sorry, we do not have enough quantity " }

    context "when the dish is available" do
      let(:available_dishes) {
        [
          { name: "pizza", price: 5, quantity: 6 },
          { name: "meatball", price: 6, quantity: 10 }
        ]
      }

      it "adds dish in basket" do
        expect(order.add("pizza", 5)).to_not be_empty
      end
    end

    context "when there are enough dishes available" do
      let(:available_dishes) {
        [
          { name: "pizza", price: 5, quantity: 6 },
          { name: "meatball", price: 6, quantity: 10 }
        ]
      }

      it "checks if there are selected dishes available " do
        expect(order.add("pizza", 5)).to eq([{ name: "pizza", price: 5, quantity: 5 }])
      end
    end

    context "when the quantity of dish is not enough" do
      let(:available_dishes) {
        [
          { name: "pizza", price: 5, quantity: 0 },
          { name: "meatball", price: 6, quantity: 0 }
        ]
      }

      it "checks if there are not selected dishes available any more " do
        expect(order.add("pizza", 15)).to eq(error_message)
      end
    end
  end

  describe "#sum_items" do
    let(:available_dishes) {
      [
        { name: "pizza", price: 5, quantity: 6 },
        { name: "meatball", price: 6, quantity: 10 }
      ]
    }

    it "sum of itemes in basket" do
      order.add("pizza", 2)
      order.add("meatball", 5)
      expect(order.sum_items).to eq(40)
    end
  end

  describe "#check_sum_items" do
    let(:available_dishes) {
      [
        { name: "pizza", price: 5, quantity: 6 },
        { name: "meatball", price: 6, quantity: 10 }
      ]
    }

    it "sum of itemes in basket" do
      order.add("pizza", 2)
      order.add("meatball", 5)
      order.tot = 40
      expect(order.check_sum_items).to be(true)
    end
  end
end
