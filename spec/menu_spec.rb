require "menu"

describe Menu do

  subject(:menu) { described_class.new(order) }
  let(:order) { double("order") }
  let(:dish) { double("dish") }
  let(:quantity) { double("quantity")}

  describe "#show" do
    it "returns menu" do
      expect(menu.show).to be_instance_of(Hash)
    end
  end

  describe "#place_order" do
    it "places order" do
      expect(order).to receive(:dish_quantity)
      menu.place_order(dish, quantity)
    end
  end

  describe "#total" do
    it "calculates total" do
      expect(order).to receive(:calculate_total)
      menu.total
    end
  end
end
