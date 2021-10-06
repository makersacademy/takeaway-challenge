require 'order'

describe Order do
  describe "#initialize" do
    # I would normally think this test as unecessary, but in this case I want to make sure that
    # if the input method for the menu changes, it muct still return an array. Is that correct?
    let(:menu) {[]}
    it "should initialize with a menu array" do      
      expect(subject.menu).to be_a Array 
    end
  end 

  describe "#add_to_order" do
    # is this test insane?
    it "should add the quantity ordered to the correct dish" do
      menu = [{:dish => "Burgers", :price => 10}]
      selection = []
      @order = Order.new(menu)
      @order.add_to_order("Burgers", 5)
      total = Total.new
      expect(@order.total.selection).to eq([{:dish => "Burgers", :price => 10, :quantity => 5}]) 
    end
  end

  describe "#request_bill" do
    it "should request the bill" do # is testing this necessary?
    
    end
  end
end
