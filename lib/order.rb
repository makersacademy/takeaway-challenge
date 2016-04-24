#require "twilio-ruby"
require_relative "menu"

class Order
  attr_accessor :order

  def initialize(menu = Menu)
    @order = []
    @menu = menu.new
  end

  def add(item, quantity = 1)
    fail "Item not on menu." unless on_menu?(item)
    quantity.times { @order << item_finder(item) }
  end

  def view
    @order.dup
  end

  def remove(item, quantity = 1)
    quantity.times { delete(item) }
  end

  def total
    total_calculator
    total = "Current order total is £#{@total}"
  end

  private

  def on_menu?(item)
    @menu.send_menu.key?(item)
  end

  def delete(item)
    @order.each.with_index do |dish, i|
      @order.slice!(i) if dish[0] == item
    end
  end

  def item_finder(item)
    @menu.send_menu.detect { |dish| dish[0] == item }
  end

  def total_calculator
    @total = 0
    @order.each { |price| @total += price[1] }
    @total
  end

end
