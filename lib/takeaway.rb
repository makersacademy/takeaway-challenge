require_relative 'menu'

class TakeAway
attr_reader :menu, :order
  def initialize
    @menu = Menu.new
    @order = {}
  end

  def show_menu
    @menu
  end

  def take_order(dish, quantity = 1)
    fail "Sorry, that item is not on the menu" unless @menu.menu_check(dish)
    @order.store.(dish, quantity)
    "#{quantity}: #{dish} have been added to your basket"
    # @items[dish] = quantity
  end

  def include?(dish)
    @items.include?(dish)
  end

  def order_summary
    @items.each do | item, quantity |
    puts "#{item}: $#{quantity}"
  end
  end

  def order_total

  end

  def checkout

  end

  def confirmed?

  end
end
