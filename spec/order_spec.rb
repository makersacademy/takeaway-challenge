require 'order'

describe Order do

  subject(:order) {described_class.new}
  subject(:dish_quantity) {double :dish_quantity}

  context "#add" do
    it "lets resturant add choosen dishes and quantity" do
      expect(order).to receive(:add).with(dish_quantity)
      order.add(dish_quantity)
    end
  end

  context "#calculate_total" do
    it "lets resturant instruct it to calculate total of the order" do
      expect(order).to receive(:calculate_total)
      order.calculate_total
    end
  end

  context "#details" do
    it "displays details of the order" do
      expect(order).to receive(:details)
      order.details
    end
  end

end
