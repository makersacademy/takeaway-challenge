require "order"

describe Order do
  describe "#taking_order" do
    # subject = Order.new.choose_dish("Salad")
    it "chooses dish from the dishlist" do
      expect(subject).to respond_to(:choose_dish).with(1).argument
    end

    it "asks if user wants to add more dishes" do
      expect(subject.choose_dish("Salad")).to eq "You can continue adding other dishes to your order"
    end

    it "adds the dish to the current order list" do
      new_order = Order.new()
      new_order.choose_dish("Salad")
      expect(new_order.current_order).to eq ["Salad"]
    end
  end
end
