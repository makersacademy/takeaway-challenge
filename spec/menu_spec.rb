require 'menu'

  describe Menu do
    subject(:menu) { described_class.new}
    describe "#initialize" do
      # it "so I can see a list of dishes with prices, initialize menu with empty list" do
      #   expect(menu.list).to eq []
      # end
    end
    it "so that I can see a list of dishes with prices, initialize menu with list" do
      item_1 = {menu_item: "Pizza", price: "8.00"}
      item_2 = {menu_item: "Nachos", price: "5.00"}
      item_3 = {menu_item: "Beer", price: "3.00"}
      expect(menu.list).to eq [item_1, item_2, item_3]
    end
  end
