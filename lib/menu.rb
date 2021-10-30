class Menu
   attr_accessor :menu_items

 def initialize
  @menu_items = {
    "Chicken": 7,
    "Tuna": 10,
    "Beef": 5
 }
 end 

 def menu_list
   @menu_items.collect do |item,price|
    "#{item} £#{price}"
   end 
  end 

end 