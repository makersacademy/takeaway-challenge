require_relative 'menu'
require_relative 'message'

class Order

def initialize 
  @menu = Menu.new 
  @message = Message.new 
  @basket = []
  @total = 0
end

def print_menu
  @menu.generate_example_menu.show_menu
end














end