require_relative 'menu'

# Understands managing orders
class Takeaway
  attr_reader :menu

  def initialize
    @order = {}
    @menu = Menu.new
  end

  def check_basket
    @order
  end

  def view_menu
    @menu.dishes
  end

  def total
    "£#{format('%.2f', 0.00)}"
  end
end
