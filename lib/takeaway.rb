class Takeaway
  attr_reader :menu_list

  @menu_list = {
      "Banitsa" => 3,
      "Cake" => 4,
      "Milkshake" => 2,
      "Cheeseburger" => 6,
      "Dumplings" => 5
    }
  
end

# my_menu = Menu.new.menu_list
# my_order = Order.new

# loop do
#   puts my_menu
#   puts "What would you like to order something?"
#   selection = gets.chomp
    
#   if selection.empty?
#     puts "Here is your order: #{my_order.order_list}" 
#     break
#   elsif 
#     my_order.add_item(selection)
#   end  
# end
