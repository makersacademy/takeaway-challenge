require 'order'

describe Order do
  let(:order) {Order.new}

  describe "#check_menu" do
    it "Consumer can check the menu list with prices" do
      expect(order.check_menu).to eq Menu::MENU
    end
  end

  describe "#select_item" do
    it "Consumer is able to select some number of several available dishes" do
      item = :soup
      quantity = 2
      expect(order.add_item(item, quantity)).to eq "Item: #{item}, Quantity: #{quantity}, has been added to your order"
    end
  end

  describe "#check_order_summary" do
    it "Consumer can check order summary" do
      order.add_item(:soup, 2)
      order.add_item(:meat, 2)
      order.add_item(:wine, 1)
      expect(order.check_order_summary).to eq [:soup, 12.0, :meat, 20.0, :wine, 6.00]
    end
  end

  describe "#place order" do
    it "A text message will be sent after order is completed" do
      order.confirm_order
      expect(order.place_order).to eq "Thank you! Your order was placed and will be delivered in about 30 minutes"

    end

  end

end
