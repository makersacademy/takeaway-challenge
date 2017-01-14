class Foodbuddy
#would decompose this to be accessed by order as well for prices

attr_reader :list

#key is name, value is price
def initialize
 @list = {"Greek-style roast fish" => 4.59,
                  "Pea falafels with minty couscous salad" => 3.59,
                  "Mixed bean chilli with wedges" => 4.09,
                  "Crab & Sweetcorn chowder" => 4.59,
                  "Quinoa frittata" => 4.99}
end
#could use to get index
def list_to_array
   id = @list.to_a
end

#test.add_dishes("Mango Quorn Curry", 5.95)
def add_dishes(dish, money)
  @list.store(dish, money)
end
#test.remove_dishes("Greek-style roast fish")
def remove_dish(dish)
  @list.delete(dish)
end
# @name    = list [:name]
# @price   = list [:price]
#
#  list = Hash[:name, :price]
end
