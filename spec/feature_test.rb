require './lib/menu'
require 'pry'

menu = Menu.new

puts
p menu.contents
# menu.review(:beef)
puts
menu.show_menu
puts



require './lib/order'

order = Order.new

order.choose(:fish)
order.choose(:beef)
p order.selections

p "sum total is: #{order.sum_total}"

p order.selections.last
