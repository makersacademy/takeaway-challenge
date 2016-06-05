require "coffee_shop"
require "order"
require "./data/menu_list"

describe CoffeeShop do
  subject { described_class.new(order_class) }
  let(:menu) { double(:menu) }
  let(:order_class) { class_double(Order, new: ()) }

  describe "#menu" do
    it "should be able to access the menu" do
      allow(subject).to receive(:menu).and_return(menu)
      expect(subject.menu).to eq(menu)
    end
  end

  describe "#total" do
    it "should return a number as the basket total price" do
      allow(subject).to receive(:total).and_return(9001)
      expect(subject.total).to be_integer
    end
  end

  describe "#basket" do
    it "should be able to hold an iterable list of items" do
      allow(subject).to receive(:basket).and_return(["Espresso", "Latte"])
      expect(subject.basket).to respond_to(:each)
    end
  end
end
