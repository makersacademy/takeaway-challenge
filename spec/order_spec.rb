require 'order'
# require'sms_text'
# include Text

describe Order do
  let(:soup) { double :soup}
  let(:meat) { double :meat}
  let(:chicken) { double :chicken}
  let(:menu) { { soup => 6.0, meat => 10.0, chicken => 8.0 } }
  let(:restaurant) { double :restaurant, menu: menu }
  let(:order) { Order.new(restaurant) }
  let(:twilio) {double :twilio, send_sms: "You will receive your order around 11:00"}

  describe "#check_menu" do
    it "Consumer can check the menu list with prices" do
      expect(order.check_menu).to eq menu
    end
  end

  describe "#add_item" do
    it "Consumer is able to select some number of several available dishes" do
      expect(order.add_item(soup, 1)).to eq "Item: #{soup}, Quantity: 1, has been added to your order"
    end

    it "Consumer is not able to select an item that is not in the menu" do
      expect(order.add_item(:carrot, 2)).to eq "Item not in menu"
    end
  end

  describe "#check_order_summary" do
    it "Consumer can check order summary" do
      order.add_item(soup, 2)
      order.add_item(meat, 2)
      order.add_item(chicken, 1)
      expect(order.check_order_summary).to eq [soup, 12.0, meat, 20.0, chicken, 8.00]
    end
  end

  describe "#confirm_order" do
    it "It returns confirmed as true" do
      expect(order.confirm_order).to eq true
    end
  end

  describe "#bill_total" do
    it "It returns the total value of the order" do
      order.add_item(soup, 2)
      order.add_item(meat, 2)
      order.add_item(chicken, 1)
      expect(order.bill_total).to eq 40.00
    end
  end

  describe "#change_item_quantity" do
    it "It changes item quantity" do
      order.add_item(soup, 2)
      order.add_item(meat, 2)
      order.add_item(chicken, 1)
      expect(order.change_item_quantity(soup, 1)).to eq "You've changed your order to Item: #{soup}, Quantity: 1"
    end
  end

  describe "#delete_item" do
    it "Deletes item from order list" do
      order.add_item(soup, 2)
      order.add_item(meat, 2)
      expect(order.delete_item(meat)).to eq "Item: #{meat} has been deleted from your order"
    end
  end

end

