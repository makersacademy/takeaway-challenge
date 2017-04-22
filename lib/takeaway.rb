require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new)
    @menu = menu
    @order = []
  end

  def see_menu
    menu.print_menu
  end

  def add_to_order(item)
    @order << @menu.dishes[item - 1]
  end

  def check_order
    @total = 0
    @order.each do |item|
      @total += item[:price]
    end
    @total
  end

end
