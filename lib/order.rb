require_relative 'menu'
require_relative 'text'

class Order
  attr_reader :current_order, :menu, :bill

  def initialize(menu = Menu.new)
    @current_order = {}
    @menu = menu
    @bill = 0
  end

  def select_item(item,quantity)
    if item_included?(item)
      @current_order[item] = quantity
    else
      raise 'please select item from menu'
    end
  end

  def check_order
    @current_order
  end

  def calculate_price
    @current_order.each do |item, price|
       @bill += menu.show_menu[item] * price
    end
    "%.2f" % @bill
  end

  def complete_order(payment)
    fail "Incorrect Payment" if payment != bill
    current_order
    calculate_price
    Text.new.send_text
  end

  private

  def item_included?(item)
    @menu.show_menu.include?(item)
  end
end
