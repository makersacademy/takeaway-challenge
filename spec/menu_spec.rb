require './lib/menu.rb'

describe Menu do
  
  describe "#show_menu" do
    it "should show a list of dishes with their prices" do
      subject.dishes("burgers", 6)
      expect(subject.show_menu).to eq [{"burgers" => 6}] 
    end
  end

end







  



# As a customer
# So that I can check if I want to order something
# I would like to see a list of dishes with prices

# As a customer
# So that I can order the meal I want
# I would like to be able to select some number of several available dishes

# class Dish
#   attr_reader :food, :price
#   def initialize(food, price)
#     @food = food
#     @price = price 
# end


# describe Dish do
#   it "should have a name" do
#     expect(dish.name).to eq name
#   end

#   it "should have a price" do
#     expect(dish.price).to eq price
#   end
# end

# Verbs: 
# order
# select

# Nouns:
# dishes
# meal 

# As a customer
# So that I can verify that my order is correct
# I would like to check that the total I have been given matches the sum of the various dishes in my order

# As a customer
# So that I am reassured that my order will be delivered on time
# I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered