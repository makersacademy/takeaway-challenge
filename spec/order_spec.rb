require 'order'

describe Order do
  before do
    @menu_class = double("MenuClass")
    allow(@menu_class).to receive(:dishes).and_return({ "Fries" => 3.0, "Coca Cola" => 1.5 })
    @order = Order.new(menu: @menu_class)
  end
  
  context "Lists available dishes" do
    
    it "Responds to #list_dishes" do
      expect(@order).to respond_to(:list_dishes)
    end

    it "#list_dishes will diplay the menu's available dishes and prices" do
      expect(@order.list_dishes).to eq({ "Fries" => 3.0,"Coca Cola" => 1.5 })
    end
  end

  context "Selecting available dishes" do
    before do
      # Stubbing stdout to not have tests write lines into the terminal
      allow($stdout).to receive(:write).and_return(nil)
    end

    it "Responds to #select_dishes" do
      expect(@order).to respond_to(:select_dishes)
    end

    it "When user types 99 loop ends" do
      allow(@order).to receive(:gets).and_return('99')
      expect(@order.select_dishes).to eq nil
    end

    it "Adds dish and correct quantity to @selected_dishes hash" do
      allow(@order).to receive(:gets).and_return("1","1", "99")
      @order.select_dishes
      expect(@order.selected_dishes).to eq({ "Fries" => 2 })
    end
  end

  context "Checking total" do
    before do
      allow($stdout).to receive(:write).and_return(nil)
      allow(@order).to receive(:gets).and_return("1","1","2","2","99")
    end

    it "Responds to #check_total" do
      expect(@order).to respond_to(:check_total)
    end

    it "Shows user how much everything in order costs" do
      @order.select_dishes     
      expect(@order.check_total).to eq "Fries 2 - £6.0\nCoca Cola 2 - £3.0\nTotal - £9.0"
    end

    it "Returns the price of a selected dishes from the menu" do
      @order.select_dishes     
      expect(@order.send(:order_total)).to eq 9
    end
  end

end
