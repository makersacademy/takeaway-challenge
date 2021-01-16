class Takeaway 
  attr_reader :basket, :menu
    
 def initialize 
   @basket = nil
   @menu = {"chow mein": 1.99, "chicken balls": 2.00, "duck pancakes": 1.00}
 end
    
 def read_menu
   @menu
 end
    
end