require_relative 'order'
require_relative 'dish'
require_relative 'menu'

class Takeaway

  attr_reader :menu

  def initialize
    @menu = Menu.new.items
  end

  def show_menu
    menu.map do |dish|
      "#{dish.name} -- £#{dish.price}"
    end
  end

  def create_order
    @order = Order.new
  end

end
