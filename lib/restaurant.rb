require_relative "menu"
class Restaurant

  attr_reader :menu, :order

  def initialize
    @order = []
  end

  def load_menu(menu = Menu.new)
    @menu = menu
  end

  def choose(dish, quantity)
    quantity.times do
      @menu.dishes.select {|k, v| @order.push([k, v]) if k == dish }
    end
    puts "You ordered #{quantity} #{dish}"
    @order
  end

  def total
    grand_total = @order.map {|arr| arr[1]}.sum
    return "Your total order will cost #{grand_total}"
  end

end
