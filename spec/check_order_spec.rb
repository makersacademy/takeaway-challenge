require 'check_order'

RSpec.describe CheckOrder do
  describe "Check that CheckOrder" do

    it "responds to check_order_is_valid" do
      expect(subject).to respond_to(:check_order_is_valid)
    end
  end

  describe "Check that check_order_is_valid works" do

    it "returns true if all dishes are included in the menu" do
      subject.new_order = [{ dish: "Dish-02", total: 2 }, { dish: "Dish-04", total: 3 }, 10.45]

      expect(subject.check_order_is_valid).to eq true
    end

    it "returns false if any dish is not included in the menu" do
      subject.new_order = [{ dish: "Dish-02", total: 2 }, { dish: "Dish-07", total: 3 }, 10.45]

      expect(subject.check_order_is_valid).to eq false
    end

    it "returns true if total is right" do
      subject.new_order = [{ dish: "Dish-02", total: 2 }, { dish: "Dish-04", total: 3 }, 10.45]

      expect(subject.check_total).to eq true
    end

    it "returns false if total is not right" do
      subject.new_order = [{ dish: "Dish-02", total: 2 }, { dish: "Dish-04", total: 3 }, 10.43]

      expect(subject.check_total).to eq false
    end
  end
end
