require_relative 'menu'

class Takeaway
  attr_reader :menu, :total

  def initialize(menu = Menu.new)
    @menu = menu
    @total = 0
    @current_order = {}
  end

  def add_menu_items(hash)
    menu.add_items(hash)
  end

  def view_menu
    menu.view_menu
  end

  def order(item, quantity = 1)
    fail "Sorry '#{item}' is not an item on the menu" if view_menu.include?(item.to_sym) == false
    @current_order[item] = quantity
    add_to_total(item,quantity)
    "4x #{item} added to basket, current total: #{total}"
  end

  def basket
    basket_string_constructor
  end

  private

  attr_reader :current_order

  def add_to_total(item,quantity)
    quantity.times {@total += menu.view_menu[item.to_sym]}
  end

  def basket_string_constructor
    return_string = ''
    current_order.each{ |x, y| return_string << "#{y}x #{x} (@#{view_menu[x.to_sym]} each), "}
    return_string + "current total: #{total}"
  end
end
