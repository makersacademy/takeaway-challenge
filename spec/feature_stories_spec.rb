require "menu"
require "order"

describe "User Stories" do
  let(:menu) {Menu.new(output_menu)}
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
      item1 = {item:"Item 1" , quantity: 1}
      order.add_item(item1)
      item2 = {item:"Item 2" , quantity: 1}
      order.add_item(item2)
      expect(order.check_order).to include(item1 && item2)
    end

    # As a customer
    # So that I can verify that my order is correct
    # I would like to check that the total I have been
    # given matches the sum of the various dishes in my order
    it "Check that the total is correct" do
      item1 = {item:"Item 1" , quantity: 2}
      order.add_item(item1)
      item2 = {item:"Item 2" , quantity: 1}
      order.add_item(item2)
      expect(order.total).to eq 5.5
    end

    # As a customer
    # So that I am reassured that my order will be delivered on time
    # I would like to receive a text such as "Thank you! Your order was
    # placed and will be delivered before 18:52" after I have ordered
    it "Place order and send text message" do
      allow(order).to receive(:complete_order).and_return(true)
      item1 = {item:"Item 1" , quantity: 2}
      order.add_item(item1)
      expect(order.complete_order).to eq true
    end
  end
end
