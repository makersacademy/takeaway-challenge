require 'restaurant'
require 'menu'

describe Restaurant do
  subject(:restaurant) { described_class.new(menu) }
  let(:menu) do
    double(
      Menu,
      available_dishes: available_dishes,
      update_item: {},
      print_menu: [{name: "pizza", price: 5, quantity: 6}]
    )
  end
  let(:available_dishes) {
    [
      { name: "pizza", price: 5, quantity: 6 },
      { name: "meatball", price: 6, quantity: 4 }
    ]
  }
   describe "#print_menu" do
     it "shows the menu" do
       expect(menu.print_menu).to eq([ {name: "pizza", price: 5, quantity: 6} ])
     end

   end

  describe "#create_order" do
    it "starts new order" do
      expect(restaurant.create_order).to be_a(Order)
    end
  end

  describe "#update menu" do
    it "updates the menu entry for each order item" do
      order = restaurant.create_order
      order.add("pizza", 2)
      order.add("meatball", 2)

      expect(menu).to receive(:update_item).twice

      restaurant.update_menu
    end
  end

  describe "#calculate_bill" do
    it "calculates bill for the order" do
      restaurant.create_order
      restaurant.order.add("pizza", 2)
      restaurant.order.add("meatball", 3)

      expect(restaurant.calculate_bill).to be(28)
    end
  end

  describe "#send_confirmation" do
    let(:message_confirmation) { double(MessageConfirmation) }

    before do
      allow(MessageConfirmation).to receive(:new).and_return(message_confirmation)
    end

    it "checks if the text is sent" do
      restaurant.create_order
      restaurant.order.add("pizza", 2)

      expect(message_confirmation).to receive(:send_message)
      restaurant.send_confirmation

    end
  end
end
