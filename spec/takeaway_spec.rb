require 'takeaway'

describe Takeaway do
  before do
    @menu_class = double("MenuClass")
    @sms = double("SMSClass")
    allow(@menu_class).to receive(:dishes).and_return({ "Fries" => 3.0, "Coca Cola" => 1.5 })
    @takeaway = Takeaway.new(menu: @menu_class,sms: @sms)
  end
  
  context "Lists available dishes" do
    
    it "Responds to #list_dishes" do
      expect(@takeaway).to respond_to(:list_dishes)
    end

    it "#list_dishes will diplay the menu's available dishes and prices" do
      expect(@takeaway.list_dishes).to eq({ "Fries" => 3.0,"Coca Cola" => 1.5 })
    end
  end

  context "Selecting available dishes" do
    before do
      # Stubbing stdout to not have tests write lines into the terminal
      allow($stdout).to receive(:write).and_return(nil)
    end

    it "Responds to #order" do
      expect(@takeaway).to respond_to(:order)
    end

    it "When user types 99 loop ends" do
      allow(@takeaway).to receive(:gets).and_return('99')
      expect(@takeaway.order).to eq nil
    end

    it "Adds dish and correct quantity to @selected_dishes hash" do
      allow(@takeaway).to receive(:gets).and_return("1","1", "99")
      @takeaway.order
      expect(@takeaway.check_order).to eq("Fries x2 - £6.0\nTotal - £6.0")
    end
  end

  context "Checking total" do
    before do
      allow($stdout).to receive(:write).and_return(nil)
      allow(@takeaway).to receive(:gets).and_return("1","1","2","2","99")
    end

    it "Responds to #check_total" do
      expect(@takeaway).to respond_to(:check_order)
    end

    it "Shows user how much everything in order costs" do
      @takeaway.order     
      expect(@takeaway.check_order).to eq "Fries x2 - £6.0\nCoca Cola x2 - £3.0\nTotal - £9.0"
    end

    it "Returns the price of a selected dishes from the menu" do
      @takeaway.order     
      expect(@takeaway.send(:order_total)).to eq 9
    end
  end

  context "Confirms customer order" do

    before do
      time = (Time.new + 3600)
      allow(@sms).to receive(:confirmation_text).and_return("Thank you! Your order was placed and will be delivered before #{time.strftime("%H:%M")}")
      @takeaway = Takeaway.new(menu: @menu_class,sms: @sms)
    end

    it "Responds to #confirm_order" do
      expect(@takeaway).to respond_to(:confirm_order)
    end

    it "Sends an sms" do
      @takeaway.confirm_order
    end
  end

end
