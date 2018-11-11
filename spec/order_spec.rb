require 'order'

describe Order do
  let(:order) {Order.new}

  describe "#check_menu" do
    it "Consumer can check the menu list with prices" do
      expect(order.check_menu).to eq Menu::MENU
    end
  end

  describe "#add_item" do
    it "Consumer is able to select some number of several available dishes" do
      item = :soup
      quantity = 2
      expect(order.add_item(item, quantity)).to eq "Item: #{item}, Quantity: #{quantity}, has been added to your order"
    end

    it "Consumer is not able to select an item that is not in the menu" do
      item = :carrot
      quantity = 2
      expect(order.add_item(item, quantity)).to eq "Item not in menu"
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


  describe "#bill_total" do
    it "It returns the total value of the order" do
      order.add_item(:soup, 2)
      order.add_item(:meat, 2)
      order.add_item(:wine, 1)
      expect(order.bill_total).to eq 38.00
    end
  end

  describe "#change_item_quantity" do
    it "It changes item quantity" do
      order.add_item(:soup, 2)
      order.add_item(:meat, 2)
      order.add_item(:wine, 1)
      expect(order.change_item_quantity(:soup, 1)).to eq "You've changed your order to Item: soup, Quantity: 1"
    end
  end

  describe "#delete_item" do
    it "Deletes item from order list" do
      order.add_item(:soup, 2)
      order.add_item(:meat, 2)
      expect(order.delete_item(:meat)).to eq "Item: meat has been deleted from your order"
    end
  end

end

