require './lib/currency_math'
require './lib/menu'

class Order
  include CurrencyMath
  include LineItemListPrinter

  DEFAULT_DELIVERY_WINDOW = 60 * 60

  def initialize(menu_items, delivery_window = DEFAULT_DELIVERY_WINDOW)
    @menu_items = menu_items
    @delivery_window = delivery_window
    @time = Time.new
  end

  def total
    @menu_items.reduce('') { |total, item| add(total, item.price) }
  end

  def time
    @time.dup
  end

  def delivery_time
    @time + @delivery_window
  end

  def to_string(conjoiner = "\n")
    line_items_string(conjoiner) + "#{conjoiner}Total: #{total}#{conjoiner}Delivers by: #{formatted_time(delivery_time)}"
  end

  private

  def formatted_time(time = @time)
    time.strftime "%H:%M"
  end
end