require_relative 'interface'
require_relative 'texter.rb'

def run
  interface = Interface.new
  order = Order.new
  puts 'Welcome to the restaurant!'
  puts 'Please enter your selection from the menu below:'
  interface.show_dishes
  interface.order_add(order)

  exit unless interface.confirm_order(order)
  texter = Texter.new("Your food is on the way!")
  texter.sendtext
end
run
