class Takeout
  require_relative 'text'

  attr_accessor :order, :menu

  def initialize(menu)
    @menu = menu
    @order = {}
  end

  def add_to_menu(items_hash)
    items_hash.each { |k, v| menu[k] = v }
  end

  def price
    order.reduce(0) { |sum, (item, value)| sum + (value * menu[item]) }
  end

  def confirm_order(mobile, time, change)
    text(mobile, time, change)
  end

end
