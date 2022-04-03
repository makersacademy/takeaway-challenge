require_relative './menu'

class Order
  def initialize(menu = Menu.new)
    @menu = menu
    @items = []
  end

  def list
    @items.join("\n")
  end

  def add(dish)
    index = dish.length - 1
    @menu.list_items.each_line do |line|
      dish_name = line[..index]
      @items.push(line[..-2]) if dish_name == dish
    end
  end
end
