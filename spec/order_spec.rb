require 'order'

describe Order do
  let(:menu)  { Menu.new}
  let(:order) { Order.new(menu) }

  describe "#check_menu" do
    it "so that I can order, it would like to check the menu list with prices" do
      expect(order.check_menu).to eq menu
    end
  end

  describe "#select_item" do
    it "So that I can order, I would like to be able to select some number of several available dishes" do
      item = "soup"
      quantity = 2
      expect(order.add_item(item, quantity)).to eq "Item: #{item} with  quantity: #{quantity}, has been added to your order"
    end
  end



end
