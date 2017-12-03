require 'restaurant'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu) }
  let(:menu) {
    [
      { name: "pizza", price: 5, quantity: 6 },
      { name: "meatball", price: 6, quantity: 4 }
    ]
  }

  describe "#available_dishes" do
    let(:menu) { [{ name: 'spaghetti', price: 5, quantity: 1 }] }

    it "checks all dishes are available" do
      expect(restaurant.available_dishes.all? { |dish| dish[:quantity] > 0 }).to be(true)
    end

    context "when some dishes are available" do
      let(:menu) {
        [
          { name: "pizza", price: 5, quantity: 6 },
          { name: "meatball", price: 6, quantity: 0 }
        ]
      }

      it "checks if some dishes are available" do
        expect(restaurant.available_dishes).to eq([{ name: "pizza", price: 5, quantity: 6 }])
      end
    end

    context "When there are not available dishes" do
      let(:menu) {
        [
          { name: "pizza", price: 5, quantity: 0 },
          { name: "meatball", price: 6, quantity: 0 }
        ]
      }
      it "checks if there are not dishes available any more" do
        expect(restaurant.available_dishes).to be_empty
      end
    end

    describe "#get_menu" do
      let(:menu) {
        [
          { name: "pizza", price: 5, quantity: 6 },
          { name: "meatball", price: 6, quantity: 4 }
        ]
      }
      it "gets menu" do
        expect(restaurant.menu).to eq([{ name: "pizza", price: 5, quantity: 6 }, { name: "meatball", price: 6, quantity: 4 }])
      end
    end



  end

  describe "#create_order" do
    it "starts new order" do

      expect(restaurant.create_order).to be_a(Order)
    end
  end

  describe "#update menu" do

    # let(:order) { [{ name: "pizza", price: 5, quantity: 3 }] }

    it "updates dishes quantity" do
      restaurant.create_order
      # p order = Order.new([{ name: "pizza", price: 5, quantity: 3 }])
      p restaurant.order.add("pizza", 2)

      expect(restaurant.update_menu).to eq([
        { name: "pizza", price: 5, quantity: 4 },
        { name: "meatball", price: 6, quantity: 4

        }
      ])
    end
  end
end
