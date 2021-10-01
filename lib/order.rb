require_relative 'menu'

class Order
  attr_reader :menu

  def initialize(menu = Menu.new)
    @menu = menu
  end

end

order = Order.new
order.menu.display_menu

puts "\nWhat would you like to order?"