require 'menu'

describe Menu do
  subject(:menu) { described_class.new(list) }
  let(:list) {
    [
      { name: "pizza", price: 5, quantity: 6 },
      { name: "meatball", price: 6, quantity: 4 }
    ]
  }
  describe "#available_dishes" do

    it "checks all dishes are available" do
      expect(menu.available_dishes.all? { |dish| dish[:quantity] > 0 }).to be(true)
    end

    context "when some dishes are available" do
      let(:list) {
        [
          { name: "pizza", price: 5, quantity: 6 },
          { name: "meatball", price: 6, quantity: 0 }
        ]
      }

      it "checks if some dishes are available" do
        expect(menu.available_dishes).to eq([{ name: "pizza", price: 5, quantity: 6 }])
      end
    end

    context "when no available dishes" do
      let(:list) {
        [
          { name: "pizza", price: 5, quantity: 0 },
          { name: "meatball", price: 6, quantity: 0 }
        ]
      }
      it "checks if there are not dishes available any more" do
        expect(menu.available_dishes).to be_empty
      end
    end
  end

  describe "#update menu" do
    let(:dish_from_basket) {{name: "pizza", price: 5, quantity: 5}}

    it "updates a dish quantity" do
      expect(menu.update_item(dish_from_basket)).to eq([
        {name: "pizza", price: 5, quantity: 1},
        { name: "meatball", price: 6, quantity: 4 }
      ])
    end
  end

end
