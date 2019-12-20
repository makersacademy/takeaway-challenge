require './lib/takeaway'
require './lib/order'

describe Takeaway do

  # Takeaway tests should not depend on another class, so I will create
  # these "fakes" expecting these will exist on the menu class that will be created later and whos
  # responsibility it will be to handle the menu and its items.
  subject(:takeaway) { described_class.new(menu_items: menu_items, order: order) }

  # create a menu double to use in place of menu class, expect
  # displayed_menu ........
  let(:menu_items) { double(:menu_items, display: displayed_menu) }

  # ......... to display the text output
  let(:displayed_menu) { "Pepperoni Pizza: 12.99" }

  # A fake order we can use for testing, so it does not rely on a non exisitant class at the moment
  let(:customer_order) { { bbq_chicken: 3, vegan: 2, hawaiian: 3 } }

  # Create a fake order with a basket total
  let(:order) { instance_double("Order", basket: 125.92) }


  describe "#display_menu_items" do
    context "Displays the menu to the user" do
      it "returns a menu list" do
        expect(takeaway.display_menu_items).to eq(displayed_menu)
      end
    end
  end

  describe "#customer_order" do
    context "creates a new customer order" do
      it "responds to placing an order" do
        expect(order).to receive(:add).at_most(5).times
        expect(takeaway.customer_order(customer_order)).to be_truthy
      end

      it "places an order with X items and returns the total cost" do
        expect(order).to receive(:add).at_most(5).times
        takeaway.customer_order(customer_order)
        expect(order.basket).to eq(125.92)
        # takeaway.order(order)
        # allow(order).to receive(:add)
        # expect(takeaway.order(order)).to eq("Your order is for £152.50")
      end
    end
  end
end