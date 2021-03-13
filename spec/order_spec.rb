require 'order'

describe Order do
  let(:order001) { Order.new }

  it "initializes with an order number" do
    expect(order001.number).to eq(1)
  end

  it "initializes with an empty basket" do
    expect(order001.basket).to be_kind_of(Array)
  end

  describe "#add_to_basket" do
    it "adds a dish name to the basket array" do
      order001.add_to_basket("Cheese Burger")
      expect(order001.basket).to eq(["Cheese Burger"])
    end

    it "adds more than one dish name to the array" do
      order001.add_to_basket("Cheese Burger")
      order001.add_to_basket("Fries")
      expect(order001.basket).to eq(["Cheese Burger", "Fries"])
    end
  end

  describe "#view_basket" do
    it "can view the basket" do
      order001.add_to_basket("Cheese Burger")
      order001.add_to_basket("Fries")
      expect(order001.view_basket).to eq(["Cheese Burger", "Fries"])
    end
  end

end
