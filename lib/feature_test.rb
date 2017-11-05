require './lib/takeaway.rb'

slix = Takeaway.new
slix.print_menu

puts "choose_item"
slix.add_to_items(item)
list = slix.items

while !list.empty? do
  slix.add_to_items(item)
  item = gets.chomp

end
