require_relative 'menu'
require_relative 'takeaway'

class Order

attr_reader :order, :menu, :total_value

  def initialize
    @order = Hash.new(0)
    @menu = Menu::DISHES
    @total_value = 0
  end

  def add_to_order(dish, amount = 1)
    @order[dish] += amount
    amount.times {@total_value += @menu[dish]}
  end

  def show_order
    @order
  end

  def order_summary
   p "Your order is: #{show_order} with a total due of £#{@total_value}"
  end
end
