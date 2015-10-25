require_relative "menu"

class Takeaway

  attr_reader :selected_dishes, :total

  def initialize (menu = Menu.new)
    @menu = menu
    @selected_dishes = []
    @total = 0
  end

  def menu_restaurant
    @menu.dishes
  end

  def select_dishes(dish, quantity = 1 )
    total_order(dish, quantity)
    @selected_dishes.each do |e|
       if e.has_key?(dish)
         e[dish] += quantity
       else
         @select_dishes  << e[dish] = quantity 
       end
     end
  end

  def total_order(dish, quantity)
    selected = @menu.dishes.select {
      |key| key.to_s.match(dish)
    }
    @total += selected[dish] * quantity
  end

end
