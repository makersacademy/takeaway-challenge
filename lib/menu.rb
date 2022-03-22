class Menu  # creating a menu class 

  attr_reader :dishes # allowing read accessibility to the dishes class
    
  def initialize(dishes) # initializes the instance variable "dishes" 
    @dishes = dishes 
  end 

  def print # defines print  
    dishes.map do |title, price| # iterates over the array of dishes 
      "%s €%.2f" % [title.to_s.capitalize, price] # prints array with capitalization
    end.join(", ") # ends print method and joins string 
  end 

  def dish_available?(dish)
    !dishes[dish].nil? 
  end 

  def price(dish)
    dishes[dish]
  end 
end  # ending the menu class 
