require_relative 'menu'

class Takeaway

attr_reader :menu, :current_order

  def initialize(given_menu = Menu.new)
    @menu = given_menu
    @current_order = Hash.new(0)
    @total = 0
  end

  def order(dish, quantity = 1)
    @current_order[dish] += quantity
  end

  def order_list
    list = []
    @current_order.each { |key, value| list << "#{value}x #{key} = £#{@menu.dishes[key] * value}" }
    puts list.join("\n")
    list.join("\n")
  end

  def total
    calculate_total
    "Total: £#{@total}"
  end

  def calculate_total
    @current_order.each { |key, value| @total +=  @menu.dishes[key] * value }
  end

end
