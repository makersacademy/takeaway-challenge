require_relative 'menu'
require_relative 'order'



class Customer

  attr_reader :order

  def initialize
    @order = Order.new
  end

  def check_menu(menu)
    menu.list_dishes if menu.is_a?(Menu) # Uses the menu.list funtion if menu
  end

  def select_dish(menu, dish, num)
    num.times do |x|
        @order.order << menu.find_dish(dish)
    end
    "#{num} #{dish} added" if @order.added?
  end

  def verify_order
    @order.print_list
  end
end
