require 'takeaway'
require 'Order_confirmation'

describe Takeaway do
  context "Menu items" do
    let (:takeaway) { Takeaway.new }

    it "prints out the main dishes items and prices" do
      expect(takeaway.view_menu).to eq "Samosas - £5, Ice Cream - £3, Fries - £5, Celery Juice - £5, Apple Pie - £7, Pizza - £15, Coffee - £4"
    end
    it "has 7 items on the menu" do
      expect(Takeaway::MENU.count).to eq 7
    end
  end

  context "Select dishes" do
    let (:takeaway) { Takeaway.new }

    it "lets the user select items from the menu" do
      expect(takeaway.select_dish("Samosas")).to eq ["Samosas"]
      expect(takeaway.clients_order).to eq ["Samosas"]
    end
  
    it "raises error if user selects an item that is not on the menu" do
      expect { takeaway.select_dish("Burger") }.to raise_error "That item is not on the menu"
    end

    it "allows the client to delete an item from their order" do
      takeaway.select_dish("Samosas")
      takeaway.delete_item("Samosas")
      expect(takeaway.clients_order).not_to include("Samosas")
    end
  end

  context "Receipt" do
    let (:takeaway) { Takeaway.new }

    it "shows the user the items they ordered plus the total" do
      takeaway.select_dish('Samosas')
      takeaway.select_dish("Ice Cream")
      expect(takeaway.check_order).to eq "Your selected items are Samosas - £5, Ice Cream - £3, and the total is £8"
    end
  end

  context "place order" do
    let (:takeaway) { Takeaway.new }
    let (:order_confirmation) { OrderConfirmation.new }
    

    it "places an order and confirms it" do
      order_confirmation = double("order confirmation double")
      allow(OrderConfirmation).to receive(:new).and_return order_confirmation
      allow(order_confirmation).to receive(:send_text_message)
      expect(takeaway.place_order).to eq order_confirmation.send_text_message
    end
  end
end
