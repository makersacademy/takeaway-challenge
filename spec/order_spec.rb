require "order"


RSpec.describe "Order" do

  describe "#place_order" do
    it "allows me to select a quantity and a dish and tells me what I have ordered" do
      order = Order.new
      expect(order.place_order("Fish", 2)).to eq ("2 x Fish have been added to your order")
    end

    it "does not allow me to select a dish not on the menu" do
      menu_double = double("menu_class", menu_contents: {"Fish" => 3, "Chips" => 2})
      order = Order.new(menu_double)
      expect{order.place_order("Chocolate", 3)}.to raise_error("Item is not on the menu")
    end
  end

  describe "view_menu" do
    it 'calls the view method from the menu class' do
      menu_double = double("menu_class", view: "menu")
      order = Order.new(menu_double)
      expect(order.view_menu).to eq("menu")
    end
  end




end
