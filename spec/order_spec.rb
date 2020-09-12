require "menu"
require "dish"
require "order"

describe Order do
  let(:menu) {
    Menu.new([Dish.new("Soul Bowl", 13.99),
              Dish.new("Tofu Donburi", 13.50),
              Dish.new("Buffalo Chick'n Burger", 10.00),
              Dish.new("Gyoza", 6.50)])
  }
  let(:order) { Order.new(menu) }

  it "expects order to be initalised with a menu" do
    expect(Order).to respond_to(:new).with(1).argument
  end

  describe "#add" do
    it "expects order to respond to add method" do
      expect(order).to respond_to(:add).with(2).arguments
    end

    it "adds the dish to the order without raising an error" do
      expect { order.add("Gyoza", 2) }.not_to raise_error
    end

    it "raises an error if the dish added is not on the menu" do
      expect { order.add("Buns", 4) }.to raise_error "Dish is not on the menu"
    end
  end

  describe "#total" do
    it "returns total value of the dishes added" do
      order.add("Gyoza", 2)
      expect(order.total).to eq 2 * 6.50
    end
  end
end
