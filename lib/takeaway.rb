require_relative "dishes"

class Takeaway

  def initialize
    @order = []
    @dishes = Dishes.new
    @order_total = 0
  end

  def order_dishes(dish, quantity = 1)
    quantity.times { search_menu(dish) }
  end

  def show_order
    @order
  end

  def show_menu
    @dishes.show_menu
  end

  def order_total
    total
  end

  private

  def search_menu(dish)
    @dishes.show_menu.each do |dish_name| 
      @order.push(dish_name) if dish == dish_name[:name]
    end
  end

  def total
    @order.each do |dish|
      @order_total += dish[:price]
    end
    @order_total
  end
end
