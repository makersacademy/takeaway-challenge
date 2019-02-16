class Takeaway

attr_reader :order
  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def view_menu
    @menu.print_menu
  end

  def add_order(order)
    @order << order
    p @order
    return @order
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

# # t = Takeaway.new(m = Menu.new)
# # t.view_menu
# o = Order.new("Pizza", 2)
# # t.add_order(o)
# # p = Order.new("Chicken", 1)
# # t.add_order(p)
