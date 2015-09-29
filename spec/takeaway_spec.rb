require 'takeaway'

describe TakeAway do

  before(:each) do
    @menu = double(:menu)
    @fancy_takeaway = TakeAway.new(@menu)
    @order = double(:order)
  end

  describe "#initialize/new" do
    it 'take argument of a menu and which can be read' do
      expect(@fancy_takeaway.menu).to eq(@menu)
    end

    it 'starts with an empty contain for orders' do
      expect(@fancy_takeaway.orders).to eq([])
    end
  end

  describe "#take_order" do
    it 'can take a new order and store it in the orders container' do
      @fancy_takeaway.take_order(@order)
      expect(@fancy_takeaway.orders).to eq([@order])
    end

    it 'can take many orders and store them in the orders container' do
      order2 = double(:order2)
      order3 = double(:order3)
      @fancy_takeaway.take_order(@order)
      @fancy_takeaway.take_order(order2)
      @fancy_takeaway.take_order(order3)
      expect(@fancy_takeaway.orders).to eq([@order,order2,order3])
    end
  end

end
