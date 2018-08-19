describe "ordering a takeaway" do

  let(:order) { Orders.new }
  let(:dish1)  { "Mystery Curry" }
  let(:dish2)  { "Donner Kebab" }
  let(:qty1)   { 2 }
  let(:qty2)   { 3 }
  
  describe "viewing the menu" do
    it "will display a list of dishes with prices" do
      expect { order.view_menu }.to output("Burger & Chips - £7\nDonner Kebab - £8\nMystery Curry - £9\nHoisin Duck Pankcakes - £10\n").to_stdout
    end
  end

  describe "picking an item from the menu" do
    it "will allow the customer to pick a dish and quantity" do
      order.choose_dish(dish1, qty1)
      expect(order.current).to eq([[dish1, qty1, 9]])
    end
  end

  describe "viewing the price for current order" do
    it "display current order along with total" do
      order.choose_dish(dish1, qty1)
      order.choose_dish(dish2, qty2)
      expect { order.view_order }.to output("DISH || QUANTITY || PRICE\nMystery Curry || 2 || 9\nDonner Kebab || 3 || 8\nTOTAL = £42\n").to_stdout
    end
  end

  describe "confirmation of delivery" do
    it "will send a SMS to the customer" do
      delivery = Delivery.new
      allow(delivery).to receive(:confirm).and_return("SMS Sent")
    end
  end

end
