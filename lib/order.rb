require 'menu'
class Order
  attr_reader :order
  alias_method :list, :order
  def initialize(menu)
    @menu = menu || Menu.new
    @order = {}
  end

  def add(items)
    order.merge!(items)
  end

  def total
    cost = order.inject(0) do |total, (dish, number)|
      total + number * @menu[dish]
    end
    cost = format '%.2f', cost / 100
    puts "Order total: £#{cost}"
    cost
  end

  def place(sum)
    fail unless sum == total
    'Thanks for your order, it should arrive in 30 mins.'
  end
end
