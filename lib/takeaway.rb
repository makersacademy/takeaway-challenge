require_relative 'menu'

class Takeaway

  attr_reader :menu, :order

  def initialize(menu = Menu.new, order = Order.new)
    @menu = menu
    @order = order
  end

  def display_menu
    @menu.current_menu.each { |name, price| "Dish:#{name} -- Price: £#{price}" }
  end

end
