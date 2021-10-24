require 'resturant'
class Customer
  attr_reader :select_dish
  def initialize(dishes = Resturant.new)
    @dishes = dishes
    @selected_dish = []
    @total = 0
  end 

  def dish_list
    @dishes
  end

  def select_dish(dish)
   @selected_dish << dish 
  end 

  def amount
   p list_of_dishes =  @dishes.dish
   p @selected_dish
   @selected_dish.each do |x|
   if x == "Mac&Cheese"
     p @total += 4
   elsif x == "Pasta" || "Pizza"
     p @total += 5
    elsif x == "Kimchi"
      p @total += 3
    elsif x == "Burger"
     p @total += 3.5
    else 
     p @total += 0
    end 
  end 
 p @total
end
end 