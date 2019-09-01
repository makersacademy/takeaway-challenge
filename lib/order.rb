# frozen_string_literal: true

class Order
  include CurrencyMath
  include LineItemListPrinter

  def initialize(menu_items, delivery_window, time_formatter = TimeFormatter.new)
    @menu_items      = menu_items
    @delivery_window = delivery_window
    @time_formatter  = time_formatter
    @time_placed     = Time.new
  end

  def total
    @menu_items.reduce('') { |total, item| add(total, item.price) }
  end

  def time
    @time_placed.dup
  end

  def delivery_time
    @time_placed + @delivery_window
  end

  def to_string(conj = "\n")
    [menu_items_string(conj), total_string, delivers_by_string].join(conj)
  end

  private

  def total_string
    "Total: #{total}"
  end

  def delivers_by_string
    "Delivers by: #{@time_formatter.format(delivery_time)}"
  end
end