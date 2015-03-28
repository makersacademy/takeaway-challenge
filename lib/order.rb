require_relative './menu'
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
    format '%.2f', cost / 100
  end

  def place(sum)
    fail unless sum == total
    "Thanks for your order, it should arrive before #{time}."
  end

  def time
    (Time.now  + 60 * 60).strftime('%H:%M')
  end
end
