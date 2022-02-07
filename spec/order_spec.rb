require_relative '../lib/order'

describe Order do
  
  subject(:order) { described_class.new } # allows the use of 'dish' instead of 'subject' for clarity  
  
  describe "#show_menu" do
    it 'shows the dishes on the menu' do
      expect{ order.show_menu }.to output("Sweetcorn Patties 3.99\nThai Red Curry (King Prawn) 6.99\nThai Red Curry (Vegetable) 5.99\nSingapore Noodles (Vegetable) 4.99\nSteamed Rice 2.99\n").to_stdout
    end
  end

  describe "#open_order" do
    it 'loads the menu with HARDCODED dishes for now' do
      order.show_menu
      order.open_order
      expect(order.order_items.length).to eq 5
    end
  end

end
