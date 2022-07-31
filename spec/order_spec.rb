require "order"

describe Order do
  let(:order) { Order.new }
  let(:pizza) { double :dish, :name => "Pizza", :price => 8.00 }

  describe "#add" do
    it "adds a specified dish to the order" do
      order.add(pizza)
      expect(order.dishes_ordered).to include(pizza)
    end
  end

  describe "#basket_summary" do
    it "displays a summary of dishes with total" do
      order.add(pizza)
      expect(order.basket_summary).to eq("Basket:\nPizza - 8.00\n\nTotal: £8.00")
    end
  end
end
