#manages the menu, is to be accessed by order for prices and menu for display
class Foodbuddy


attr_reader :list, :id

#key is name, value is price enhancement is to read file for contents
def initialize
 @list = {"0.Greek-style roast fish" => 4.59,
                  "1.Pea falafels with minty couscous salad" => 3.59,
                  "2.Mixed bean chilli with wedges" => 4.09,
                  "3.Crab & Sweetcorn chowder" => 4.59,
                  "4.Quinoa frittata" => 4.99}
end
#could use to get index
def list_to_array
   @id = @list.to_a
end

#test.add_dish("Mango Quorn Curry", 5.95)
def add_dish(dish, money)
  @list.store(dish, money)
end
#test.remove_dish("Greek-style roast fish")
def remove_dish(dish)
  @list.delete(dish)
end
# to initialize
#@ ID  = list [:ID]
# @name    = list [:name]
# @price   = list [:price]
#
#  list = Hash[:ID, :name, :price]
end
