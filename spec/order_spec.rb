require "order"

describe Order do
  describe "#taking_order" do
    it "chooses dish from the dishlist" do
      expect(subject).to respond_to(:choose_dish).with(1).argument
    end

    it "asks if user wants to add more dishes" do
      expect(subject.choose_dish("dish_one")).to eq "Do want to add another dish to your order?"
    end
  end
end
