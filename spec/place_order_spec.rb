require "place_order"

describe Place_order do
  subject(:place_order) {described_class.new}
  let(:order) { {"sushi" => 4, "noodles" => 4} }

  describe "#adds" do
    it "#add sushi and noodles with quantity of 4each into current order" do
      place_order.add("sushi", 4)
      place_order.add("noodles", 4)
      expect(place_order.current_order).to eq(order)
    end

    describe "#total" do
      it "shows total value of the order" do
        place_order.add("sushi", 4)
        place_order.add("noodles", 4)
        place_order.total
        expect(place_order.total).to eq("Your total bill is £68")
      end
    end
  end
end
