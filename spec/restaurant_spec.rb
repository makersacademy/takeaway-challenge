require 'restaurant'

describe Restaurant do
  describe "#available_dishes" do

    subject(:restaurant) { described_class.new(menu) }

    let(:menu) { [{ name: 'spaghetti', price: 5, quantity: 1 }] }
    # let(:error_message) {'There are not available dishes'}

    it "checks all dishes are available" do
      expect(restaurant.available_dishes.all? { |dish| dish[:quantity] > 0 }).to be(true)
    end

    context "when some dishes are available" do
      let(:menu) {
        [
          { name: "pizza", price: 5, quantity: 6 },
          { name: "meatball", price: 6, quantity: 0}
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
          { name: "meatball", price: 6, quantity: 0}
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
          { name: "meatball", price: 6, quantity: 4}
        ]
      }
      it "gets menu" do
        expect(restaurant.menu).to eq([{ name: "pizza", price: 5, quantity: 6 },{ name: "meatball", price: 6, quantity: 4}])
      end
    end

    describe "#create_order" do
      it "starts new order" do

        expect(restaurant.create_order).to be_a(Order)
      end
    end
  end
end
