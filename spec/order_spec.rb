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
        expect(order.basket).to eq [{:dish=>"Pepperoni Pizza", :quantity=>2}]
    end

    it "should raise error if the item is not on the menu" do
      expect { order.add("Toast", 2) }.to raise_error "This dish is not on the menu"
    end

  end

  describe "#total" do
    it "should give the total price of the basket" do
      order.add("Fish & Chips", 2)
      order.add("Ceasar Salad", 3)
      expect(order.total).to eq 17
    end
  end

  describe "#delete" do
    it "should delete a dish and quantity from the basket" do
      order.add("Fish & Chips", 2)
      order.delete("Fish & Chips", 1)
      expect(order.basket).to eq [{:dish=>"Fish & Chips", :quantity=>1}]
    end
  end








end
