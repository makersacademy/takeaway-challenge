class Takeaway

attr_reader :menu, :order
  def initialize(menu = Menu.new, order: nil)
    @menu = menu
    @order = []
  end

  def view_menu
    @menu.print_menu
  end

  def add_order(order)
    p @order << order
  end

end

class Menu
  attr_reader :dishes
  def initialize
    @dishes = [{ :dish => "Chicken", :price => "£3.50" },
    { :dish => "Pizza", :price => "£4" }]
  end

  def print_menu
    @dishes.map { |x| x.values.join(" ") }
  end
end


class Order

  attr_reader :dish, :quantity

  def initialize(dish, quantity)
    @dish = dish
    @quantity = quantity
  end

end
