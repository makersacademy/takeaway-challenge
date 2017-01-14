require "menu"
require "order"

describe "User Stories" do
  let(:menu) {Menu.new}
  let(:output_menu) {Output_Menu.new}
  let(:order) {Order.new}

  context "While checking the menu" do
    # As a customer
    # So that I can check if I want to order something
    # I would like to see a list of dishes with prices
    it "I would lile to see a list of dished" do
      expect(menu.display_menu).not_to be_empty
    end

    it "It displays at least one dish" do
      expect(menu.display_menu[0][:item]).not_to be_empty
    end

    it "It displays at least one price" do
      expect(menu.display_menu[0][:price]).not_to be(nil)
    end
  end

  context "While placing an order" do
    # As a customer
    # So that I can order the meal I want
    # I would like to be able to select some number of several available dishes
    it "Be able to selct some dishes" do
      item1 = {item:"Curry" , quantity: 1}
      order.add_item(item1)
      item2 = {item:"Curry" , quantity: 1}
      order.add_item(item2)
      expect(order.check_order).to include(item1 && item2)
    end
  end
end
