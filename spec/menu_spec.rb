require 'menu'

describe Menu do
  describe "#available_dishes" do

    subject(:menu) { described_class.new(dishes) }

    let(:dishes) { [{ name: 'spaghetti', price: 5, quantity: 1 }] }
    let(:error_message) {'There are not available dishes'}

    it "checks all dishes are available" do
      expect(menu.available_dishes.all? { |dish| dish[:quantity] > 0 }).to be(true)
    end

    context "when some dishes are available" do
      let(:dishes) {
        [
          { name: "pizza", price: 5, quantity: 6 },
          { name: "meatball", price: 6, quantity: 0}
        ]
      }

      it "checks if some dishes are available" do
        expect(menu.available_dishes).to eq([{ name: "pizza", price: 5, quantity: 6 }])
      end
    end

    context "When there are not available dishes" do
      let(:dishes) {
        [
          { name: "pizza", price: 5, quantity: 0 },
          { name: "meatball", price: 6, quantity: 0}
        ]
      }
      it "raises an error if there are not dish available any more" do
        expect(menu.available_dishes).to be_empty
      end
    end
  end
end
