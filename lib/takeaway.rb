class Takeaway
  attr_reader :menu

  def initialize
  @menu = []
  end

  def add_dishes(dish, price)
    @dish = dish
    @price = price
    @menu << { Dish: @dish, Price: @price }    
  end

  def print_menu
   @menu.each { |dishes| puts "#{dishes[:Dish]}: £#{dishes[:Price]}" }
  end

end
