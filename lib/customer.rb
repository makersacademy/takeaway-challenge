require 'resturant'
class Customer
  attr_reader :selected_dish

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
    list_of_dishes = @dishes.dish
    list_of_dishes[0]
   @selected_dish.each do |x|
    list_of_dishes[0].each do |dish, price|
      p dish
      if x == dish
        @total += price
      end 
    end 
  end 
  end 
  @total
end