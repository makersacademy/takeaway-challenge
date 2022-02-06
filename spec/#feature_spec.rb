require_relative '../lib/takeaway'
require_relative '../lib/dish'
require_relative '../lib/menu'


context "User Stories" do

  before do
    @takeaway = Takeaway.new(@menu = Menu.new())
    @dish1 = Dish.new("Chicken", 1.5)
    @dish2 = Dish.new("Chips", 0.5)
    @dish3 = Dish.new("Coke", 0.8)
    @menu.add(@dish1)
    @menu.add(@dish2)
    @menu.add(@dish3)
  end
  
  # As a customer
  # So that I can check if I want to order something
  # I would like to see a list of dishes with prices 

  describe 'User Story 1' do
    it 'prints a list of available dishes with prices' do
      str = "Chicken: £1.50\nChips: £0.50\nCoke: £0.80"
      expect(@takeaway.menu.view).to eq(str)
    end
  end

  # As a customer
  # So that I can order the meal I want
  # I would like to be able to select some number of several available dishes

  describe 'User Story 2' do
    it 'returns a list of selected dishes' do
      @takeaway.start_new(order = Order.new(@takeaway.menu))
      order.select(@dish1)
      order.select(@dish2)
      order.select(@dish1)
      expect(order.dishes).to include @dish1, @dish2, @dish1

    end

  end

  # As a customer
  # So that I can verify that my order is correct
  # I would like to check that the total I have been given matches the sum of the various dishes in my order

  describe 'User Story 3' do
    it 'prints a list of orders with prices' do
      @takeaway.start_new(order = Order.new(@takeaway.menu))
      str = "Chicken: £1.50\nChips: £0.50\nChicken: £1.50"
      str += "\n--------------------\n\nCurrent total = £3.50"
      order.select(@dish1)
      order.select(@dish2)
      order.select(@dish1)
      expect(@takeaway.current_order.view).to eq(str)
    end

  end

end



# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered

describe 'User Story 4' do
  xit 'confirms an order' do
    
  end
  xit 'returns a message 30 minutes in the future' do
    
  end
  xit 'sends a text message' do
    
  end
end
