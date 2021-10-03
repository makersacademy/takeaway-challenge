require "order"

describe Order do
  describe "#take_order" do
    it "chooses dish from the dishlist" do
      expect(subject).to respond_to(:choose_dish).with(1).argument
    end

    it "user can add more dishes" do
      subject.choose_dish(:dish1)
      subject.choose_dish(:dish2)
      expect(subject.current_order.size).to eq 2
    end

    it "adds the dish to the current order list" do
      subject.choose_dish(:dish1)
      expect(subject.current_order).to eq [[:dish1, 10]]
    end
  end
  describe "#confirm price" do
    it "calculates the total price" do
      subject.choose_dish(:dish1)
      subject.choose_dish(:dish2)
      expect(subject.calculate_price).to eq 24
    end
  end
  describe "#order confirmation" do
    it "send order confirmation" do
      expect(subject.confirm_order).to start_with "Thank you! Your order was placed and will be delivered before"
    end
  end
end
