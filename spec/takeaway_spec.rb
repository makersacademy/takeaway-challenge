require './lib/takeaway'
require './lib/order'

describe Takeaway do

  subject(:takeaway) { described_class.new(menu_items: menu_items, order: order) }
  let(:menu_items) { instance_double("MenuItems", display: displayed_menu) }
  let(:displayed_menu) { "Regina £12.89, Hawaiian £18.99, Bbq_chicken £12.99, Vegan £14.99, Vegetarian £8.99" }
  let(:customer_order) { { bbq_chicken: 3, vegan: 2, hawaiian: 3 } }
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
        expect(subject.order).to receive(:add).at_most(5).times
        basket = takeaway.customer_order(customer_order)
        total = 125.92
        expect(subject.order.basket).to eq(total)
      end
    end
  end
end