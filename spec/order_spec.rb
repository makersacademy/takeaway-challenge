require "order"
require "menu"

describe Order do
  subject(:order) { described_class.new(menu) }

  let(:menu) { double(:menu) }
  let(:foods) do
    {
      wings: 5.00,
      pizza: 7.00
    }
  end

  before do
    allow(menu).to receive(:has_food?).with(:wings).and_return(true)
    allow(menu).to receive(:has_food?).with(:pizza).and_return(true)
    allow(menu).to receive(:price).with(:wings).and_return(5.00)
    allow(menu).to receive(:price).with(:pizza).and_return(7.00)
  end

  describe "#add_to_order" do
    it "it enables several dishes to be selected from the menu" do
      dummy_order
      expect(order.foods).to eq(foods)
    end

    it "it won't allow users to order items not on the menu" do
      allow(menu).to receive(:has_food?).with(:cheesefries).and_return(false)
      expect { order.add_to_order(:cheesefries, 3) }.to raise_error("That isn't on the menu!")
    end

    it "it calculates a total for an order" do
      dummy_order
      total = 74.00
      expect(order.total).to eq(total)
    end
  end

  def dummy_order
    order.add_to_order(:wings, 5.00)
    order.add_to_order(:pizza, 7.00)
  end
end
