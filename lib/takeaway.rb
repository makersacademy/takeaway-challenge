require_relative 'menu'
require_relative 'order'

class Takeaway
  def initialize(menu_class = Menu, order_class = Order)
    @menu_class = menu_class
    @order_class = order_class
  end

  def open
    while true
      display_menu
      take_order
      p ""
      p "You will receive a text message with delivery details."
      p ""
      p "To place another order, please hit enter"
      p "To quit, please enter 'Q'."
      answer = gets.chomp.upcase
      break if answer == "Q"
    end
  end

  def display_menu(menu_class = @menu_class)
    p "Please select your dishes from the menu below."
    @menu = menu_class.new
    @menu.display_menu
  end

  def take_order(order_class = @order_class)
    p "Please enter the dish number and quantity ([dish number], [quantity])"
    p "To finish, just hit enter twice"
    new_order = order_class.new(@menu.menu)
    new_order.take_order
    p "Please enter the total price"
    new_order.place_order
    new_order.print_order
  end
end
