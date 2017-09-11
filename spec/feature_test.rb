require_relative '../lib/menu'
require_relative '../lib/messenger'
require_relative '../lib/order'
require 'pry'

menu = Menu.new([['catnip', 5], ['CATnip', 10], ['CATNIP', 15]])
messenger = Messenger.new

puts "Welcome to The Catnip Emporium\nPlease take a look at our menu\n"

menu.show

puts "Make your selection by entering each number on a new line\n"

selection = []
input = 'default'
while input != ''
  input = gets.chomp
  selection << input.to_i if input != ''
end

order = Order.new(selection, menu)
# binding.pry
order.view

puts "enter 'yes' to confirm\n"

message = order.confirm if gets.chomp == 'yes'
messenger.send_sms(message)
