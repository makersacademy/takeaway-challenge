require_relative 'restaurant'

puts "Creates a new Restaurant"
puts thai_cottage = Restaurant.new

puts "Shows the menu"
puts thai_cottage.view_menu.starters
