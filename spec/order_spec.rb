require "order"

describe "order" do

  let(:order) { Order.new }

  describe "#initialize" do
    it "should create an empty basket" do
      expect(order.basket).to be_empty
    end
  end

  describe "#add" do
    it "should add a dish and the quantity to basket" do
      order.add("Pepperoni Pizza", 2)
        expect(order.basket).to eq [{"Pepperoni Pizza"=>2}]
    end

    it "should raise error if the item is not on the menu" do
      expect { order.add("Toast", 2) }.to raise_error "This dish is not on the menu"
    end

  end







end
