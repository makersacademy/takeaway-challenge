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

    it "When user types exit loop ends" do
      allow(@order).to receive(:gets).and_return('exit')
      expect(@order.select_dishes).to eq nil
    end

    it "Raises an error if dish typed by user not in menu" do
      allow(@order).to receive(:gets).and_return("", "Burger", "2'", "exit")
      expect { @order.select_dishes }.to raise_error "Dish not in menu"
    end

    it "Adds dish and correct quantity to @selected_dishes hash" do
      allow(@order).to receive(:gets).and_return("", "Fries", "2'", "exit")
      @order.select_dishes
      expect(@order.selected_dishes).to eq({ "Fries" => 2 })
    end

    it "If dish already selected previously by user it updates the value" do
      allow(@order).to receive(:gets).and_return("", "Fries", "2", "exit")
      @order.select_dishes 
      allow(@order).to receive(:gets).and_return("", "Fries", "3", "exit")
      @order.select_dishes 
      expect(@order.selected_dishes).to eq({ "Fries" => 5 })
    end

  end

  context "Checking total" do
    
    before do
     allow($stdout).to receive(:write).and_return(nil)
    end

    it "Returns the price of a selected dishes from the menu" do
      allow(@order).to receive(:gets).and_return("", "Fries", "2", "exit")
      @order.select_dishes 
      allow(@order).to receive(:gets).and_return("", "Coca Cola", "2", "exit")
      @order.select_dishes 
      expect(@order.send(:order_total)).to eq 9
    end
  end

end
