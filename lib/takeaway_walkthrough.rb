class Takeaway

attr_reader :menu, :order
  def initialize(menu = Menu.new, order: nil)
    @menu = menu
    @order = order
  end

  def view_menu
    @menu.print_menu
  end

  # def place_order(dishes)
  #   dishes.each do |dish, quantity|
  #     order.add(dish, quantity)
  #   end
  # end

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
