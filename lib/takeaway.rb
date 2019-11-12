require './lib/menu.rb'

class Takeaway
  attr_reader :menu, :order

  def initialize(menu_class = Menu)
    @menu = menu_class.new
    @order = {}
  end

  def add(item, quantity = 1)
    message = "Unable to add item to order as not on menu"
    fail message if !menu.key?(item)

    if order.key?(item)
      @order[item] += quantity
    else
      @order[item] = quantity
    end
  end
end
