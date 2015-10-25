require_relative "menu"

class Takeaway

  attr_reader :selected_dishes, :total

  def initialize (menu = Menu.new)
    @menu = menu
    @selected_dishes = Hash.new(0)
    @total = 0
    @total_per_dish = 0
  end

  def menu_restaurant
    @menu.dishes
  end

  def select_dishes(dish, quantity = 1 )
    total_order(dish, quantity)
    @selected_dishes[dish] += quantity
    info(dish, quantity)
  end

  private

  def total_order(dish, quantity)
    selected = @menu.dishes.select {
      |key| key.to_s.match(dish)
    }
    @total_per_dish = selected[dish] * quantity
    @total += selected[dish] * quantity
  end

  def info(dish, quantity)
    puts "you ordered #{quantity} x #{dish} = #{@total_per_dish}"
    @total_per_dish = 0
    puts "the total now is #{@total}"
  end

end
