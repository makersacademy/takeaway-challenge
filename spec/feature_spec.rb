require 'takeaway'

RSpec.describe Takeaway do
  describe "Feature Tests" do
    before(:each) do
      @t = Takeaway.new
    end
    it "should display a menu" do
      expect(@t.read_menu).to be_a(Hash)
    end

    it "should be able to order multiple dishes and add it to basket_summary" do
      @t.order("Thing1", 5)
      @t.order("Thing2", 2)
      expect(@t.basket_summary).to eq("Thing1 x 5 = £50, Thing2 x 2 = £24")
    end
    
    it "should be able to return the correct total" do
      @t.order("Thing1", 5)
      @t.order("Thing2", 2)
      expect(@t.total).to eq(74)
    end
    
    it "should raise an error if someone tries to checkout with wrong amount" do
      @t.order("Thing1", 5)
      expect { @t.checkout(10) }.to raise_error("Please enter the exact sum")
    end

    it "should send a text when the user checks out correctly" do
      @menu = double('menu')
      @order = double('order')
      @dish = double(:dish)
      @text = double('text')
      allow(@menu).to receive(:display).and_return({ @dish => 10 })
      allow(@order).to receive(:take).and_return([[@dish, 2]])
      allow(@order).to receive(:details).and_return([[@dish, 2, 10]])
      allow(@text).to receive(:send).and_return(true)
      @takeaway = Takeaway.new(@menu, @order, @text)
      @takeaway.order(@dish, 2)
      expect(@takeaway.checkout(20)).to eq(true)
    end
  end
end