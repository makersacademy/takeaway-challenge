# main program class - runs the program
# i have decided not to use dep injection here to make the app more user
# friendly. now in order to begin all the user needs to do is enter:
# main = Main.new ; main.main
require_relative 'dish'
require_relative 'menu'
require_relative 'menudisplay'
require_relative 'order'
require_relative 'message_processor'
class Main

  attr_reader :menu

  def initialize(menu=nil)
    @menu = Menu.new(Dish, menu) # can use own menu or random
    @order = Order.new(Dish)
    @display = MenuDisplay.new(Dish, @menu, @order)
    @message_processor = MessageProcessor.new
  end

  def main
    while true
      @display.print_interface
      command = gets.chomp
      break if command == 'q'
      if command.to_i.to_s == command && command.to_i < menu.dish_list.length + 1
        @order.add_dish(@menu.dish_list[command.to_i - 1])
      elsif command == 'clear'
        @order.dish_list.clear
      elsif command == 'order'
        @order.place_order
        puts 'Thank your for your order'
        break
      end
    end
  end
end
