require_relative './menu'

class Takeaway
  def initialize(menu = Menu.new)
    @menu = menu
    @current_order = []
  end

  def show_menu
    @menu.list_items
  end

  def show_order
    @current_order.join
  end

  def add_to_order(dish)
    index = dish.length - 1
    show_menu.each_line do |line|
      dish_name = line[..index]
      @current_order.push(line) if dish_name == dish
    end
  end
end
