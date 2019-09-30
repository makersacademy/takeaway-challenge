require 'order'

describe Order do
  subject(:order){described_class.new}

  describe '#view_menu' do
    it "prints out the menu" do
      expect(order.view_menu).not_to be_empty
    end
  end

  describe '#view_order' do
    it "prints out the customer's order" do
      expect(order.view_order).to be_empty
    end
  end

  describe '#add_dish' do
    it "adds a choosen item to the customer's order" do
      order.add_dish("cod", 2)
      expect(order.view_order).to eq [["cod", 2, 12]]
    end
    it "advises if an order was not successful" do
      expect(order.add_dish("goat")).to include "Sorry"
    end
  end

  describe '#calculate_total' do
    it "adds the price of each order to get total cost" do
      order.add_dish("cod", 2)
      order.add_dish("haddock")
      order.add_dish("chips", 3)
      expect(order.calculate_total).to eq 28
    end
  end

end
