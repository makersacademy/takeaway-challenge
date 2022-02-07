require_relative '../lib/order'

describe Order do
  
  subject(:order) { described_class.new } # allows the use of 'dish' instead of 'subject' for clarity  
  
  describe "#show_menu" do
    it 'shows the dishes on the menu' do
      expect{ order.show_menu }.to output("Sweetcorn Patties 3.99\nThai Red Curry (King Prawn) 6.99\nThai Red Curry (Vegetable) 5.99\nSingapore Noodles (Vegetable) 4.99\nSteamed Rice 2.99\n").to_stdout
    end
  end

  describe "#open_order" do
    it 'opens the order with the menu item quantities all intialised to 0' do
      order.show_menu
      order.open_order
      expect(order.order_items.length).to eq 5
    end
  end

  describe "#add_dish" do
    it 'this increases the quantity of the dish by the given amount, or 1 by default' do
      order.show_menu
      order.open_order
      order.add_dish("Sweetcorn Patties", 2)
      expect(order.order_items[:"Sweetcorn Patties"]).to eq 2  # rubocop doesn't like "Swe..".to_sym
      order.add_dish("Singapore Noodles (Vegetable)")
      expect(order.order_items[:"Singapore Noodles (Vegetable)"]).to eq 1
    end
  end

  describe "#check_order" do
    it 'check that the order items, amounts and overall price is what the customer is expecting' do
      order.show_menu
      order.open_order
      order.add_dish("Sweetcorn Patties", 2)
      order.add_dish("Singapore Noodles (Vegetable)")
      order.check_order
      expect(order.total).to eq 12.97
    end
  end

end
