require_relative 'menu'

class Order

  attr_reader :basket

  def initialize(menu = Menu.new)
    @menu = menu
    @basket = []
  end

  def add(item, amount = 1)
    raise 'This is not on the menu!' unless @menu.dishes.include?(item)
    amount.times {@basket << item}
  end

  def calculate_total
    price = 0
    @basket.each { |item| price += @menu.dishes[item] }
    price
  end

  def order_summary
    "Thank you! Your order totalling £#{calculate_total} will arrive at #{delivery_time}"
  end

  def delivery_time
    "#{(Time.now + 1 * 60 * 60).hour}:#{Time.now.min}"
  end


end
