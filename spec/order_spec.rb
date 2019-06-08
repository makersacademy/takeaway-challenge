require "order"


RSpec.describe "Order" do

  describe "#initialize" do

    xit "creates an instance of the menu class" do
      order = Order.new
      expect(order.menu).to be_an_instance_of(Menu)
    end

    xit "creates an instance of the Cost_calculator class" do
      order = Order.new
      expect(order.cost_calculator).to be_an_instance_of(Cost_calculator)
    end

    xit "has an empty current_order array" do
      order = Order.new
      expect(order.current_order).to eq([])
    end

  end

  describe "#place_order" do
    xit "allows me to select a quantity and a dish and tells me what I have ordered" do
      order = Order.new
      expect(order.place_order("Fish", 2)).to eq ("2 x Fish have been added to your order")
    end

    xit "does not allow me to select a dish not on the menu" do
      menu_double = double("menu_class", menu_contents: {"Fish" => 3, "Chips" => 2})
      order = Order.new(menu_double)
      expect{order.place_order("Chocolate", 3)}.to raise_error("Item is not on the menu")
    end
  end

  describe "#running_total" do

    xit "returns a running total of the cost of your order" do
      menu_double = double("menu_class", menu_contents: {"Fish" => 3})
      order = Order.new(menu_double)
      allow(order).to receive(:current_order) {[{"dish" => "Fish", "quantity" => 3}]}
      expect(order.running_total) .to eq("Your total so far: 9")
    end

  end


  describe "view_menu" do
    xit 'calls the view method from the menu class' do
      menu_double = double("menu_class", view: "menu")
      order = Order.new(menu_double)
      expect(order.view_menu).to eq("menu")
    end
  end

  describe "current_order" do

    xit 'displays your order so far' do
      menu_double = double("menu_class", menu_contents: {"Fish" => 3, "Chips" => 2})
      order = Order.new(menu_double)
      order.place_order("Fish", 3)
      order.place_order("Chips", 1)
      expect(order.current_order).to eq([{"dish" => "Fish", "quantity" => 3},{ "dish" => "Chips", "quantity" => 1}])
    end

  end





end
