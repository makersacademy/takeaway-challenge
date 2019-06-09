class Takeaway
  def initialize
    @menu = Menu.new
    @order = Order.new
  end

  def add_order(dish, quantity)
    @order.add_selection(dish, quantity)
  end

  def print_menu
    p @menu.list
  end

  def total
    @order.total_cost
  end
end

class Menu
  attr_reader :list
  def initialize
    @list = {
      burger: 5,
      salad: 4
    }
  end

  def from_menu
    p "called from Menu"
  end
end

class Order
  attr_reader :selection
  def initialize
    @selection = []
  end

  def add_selection(dish, quantity)
    @selection << { dish: dish, quantity: quantity }
  end

  def total_cost
    @selection.each do |item|
      # p item[:quantity]
      # p item[:dish]
      p @menu
    end
  end
end
