require_relative 'menu'
require_relative 'order'

class Takeaway

  attr_reader :order

  def initialize(menu, order = nil)
    @menu = menu
    @order = order || Order.new(menu)
  end

  def view_menu
    @menu.print_menu
  end

  def choose(dishes)
    dishes.each do |name, quantity|
      @order.add(name, quantity)
    end
  end
end
