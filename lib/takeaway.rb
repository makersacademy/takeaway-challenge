require_relative 'menu'
require_relative 'order'
require_relative 'check_total'

class Takeaway

  def initialize(order_class = Order.new(Menu.new.menu))
    @order = order_class
  end

  def menu
    make_symbol(hash_formatter(@order.inventory))
  end

  def current_order
    make_symbol(@order.order.map { |item| hash_formatter(item) })
  end
  
  def add(dish)
    @order.add(dish)
  end

  def check_total(checker = CheckTotal.new)
    checker.check_total(@order.order)
  end

  private

  def hash_formatter(hash)
    hash.map { |dish, price| "#{dish}: #{price}" }
  end

  def make_symbol(input)
    input.join(", ").to_sym
  end

end
