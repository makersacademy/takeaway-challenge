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

  def order(item, quantity)
    add_to_total(item,quantity)
    "4x #{item} added to basket, current total: #{total}"
  end

  private

  attr_reader current_order

  def add_to_total(item,quantity)
    quantity.times {@total += menu.view_menu[item.to_sym]}
  end
end
