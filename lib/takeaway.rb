require_relative 'menu'
require_relative 'phone'

class Takeaway

  attr_reader :dishes, :order, :exact_total

  def initialize
    @dishes = DISHES
    @order = []
  end

  def print_dishes
    Menu.new.print_dishes
  end

  def dish_order(dish, amount = 1, exact_total)
    raise "Sorry, that dish isn't on the menu" unless @dishes.key?(dish.to_sym)
    amount.times { @order << dish.to_sym }
    @exact_total = exact_total
  end

  def order_amount
    @order.map { |dish| @dishes[dish] }.inject(:+)
  end

  def send_order
    raise "Exact amount... yeah right!" if @exact_total != order_amount
    Phone.new.send_text(order_amount)
  end

end
