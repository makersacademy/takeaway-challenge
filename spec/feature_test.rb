require_relative '../lib/menu'
require_relative '../lib/messenger'
require_relative '../lib/order'
require 'pry'

menu = Menu.new([['catnip', 5], ['CATnip', 10], ['CATNIP', 15]])

puts "Welcome to The Catnip Emporium\nPlease take a look at our menu"

menu.show

puts "Make your selection by entering each number on a new line"

selection = []
input = 'default'
while input != ''
  input = gets.chomp
  selection << input.to_i if input != ''
end

order = Order.new(selection, menu)
# binding.pry
order.view

puts "enter 'yes' to confirm"

order.confirm if gets.chomp == 'yes'
