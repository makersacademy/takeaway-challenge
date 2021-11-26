require 'order'

describe Order do
  before do
    @menu_class = double("MenuClass")
    @order = Order.new(menu: @menu_class)
  end
  
  context "Lists available dishes" do
    
    it "Responds to #list_dishes" do
      expect(@order).to respond_to(:list_dishes)
    end

    it "#list_dishes will diplay the menu's available dishes and prices" do
      allow(@menu_class).to receive(:dishes).and_return({ "Fries" => 3.0,"Coca Cola" => 1.5 })
      expect(@order.list_dishes).to eq({ "Fries" => 3.0,"Coca Cola" => 1.5 })
    end
  end

end
