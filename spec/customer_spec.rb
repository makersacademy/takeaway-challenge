require "customer"

describe Customer do

  let(:restaurant) { double :restaurant }
  let(:dish) { double :dish }
  let(:amount) { double :amount }
  let(:total) { double :total }

  describe ".order" do
    it "responds to order with 3 arguments" do
      expect(subject).to respond_to(:order).with(3).argument
    end

    it "calls take_order on restaurant when called" do
      expect(restaurant).to receive(:take_order).with(dish, amount)
      subject.order restaurant, dish, amount
    end
  end

  describe ".confirm_total" do
    it "responds to confirm_order with 2 argument" do
      expect(subject).to respond_to(:confirm_total).with(2).argument
    end

    it "calls confirm_order on restaurant when called" do
      expect(restaurant).to receive(:confirm_order).with(total)
      subject.confirm_total restaurant, total
    end
  end

end
