###
require_relative 'menu'

class Order

  # more commonly known as half an hour
  PROCESSING_TIME = 1800

  def initialize(menu_instance)
    @contents = {}
    @menu = menu_instance
  end

  def add(item, quantity)
    @contents[item] = quantity
  end

  def complete
    "You ordered #{contents_formatted}. Your total comes to £#{calculate_total}.
    Your order will be delivered at #{calculate_time}"
  end

  private

  def calculate_total
    @contents.map { |item, quantity| @menu.items[item] * quantity}.inject(:+)
  end

  def contents_formatted
    @contents.map { |item, quantity| "#{quantity} #{item}s"}.join(", ")
  end

  def calculate_time
    require 'date'
    time = Time.now + PROCESSING_TIME
    time.strftime("%H:%M")
  end

end

# order = Order.new(Menu.new)
# order.calculate_time
# order.add("starter",3)
# order.add("main",5)
#
# puts order.complete
