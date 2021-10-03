require "order"

describe Order do
  describe "#take_order" do
    it "chooses dish from the dishlist" do
      expect(subject).to respond_to(:choose_dish).with(1).argument
    end

    it "user can add more dishes" do
      new_order = Order.new()
      new_order.choose_dish(:dish1)
      new_order.choose_dish(:dish2)
      expect(new_order.current_order.size).to eq 2
    end

    it "adds the dish to the current order list" do
      new_order = Order.new()
      new_order.choose_dish(:dish1)
      expect(new_order.current_order).to eq [[:dish1, 10]]
    end
  end
  describe "#confirm_order" do
    it "calculates the total price" do
      new_order = Order.new()
      new_order.choose_dish(:dish1)
      new_order.choose_dish(:dish2)
      expect(new_order.calculate_price).to eq 24
    end
  end
end
