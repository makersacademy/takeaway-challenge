require "dotenv/load"
require "twilio-ruby"
require_relative "menu"
require_relative "menu_item"
require_relative "messager"
require_relative "order"
require_relative "order_item"

class OrderProcess
  def self.start
    menu = Menu.new
    menu.load_from_csv
    puts "Hello and welcome to the takeaway! Please see our menu:"
    menu.display

    order = Order.new
    loop do
      puts "Please enter the ID number of an item to order"
      item = gets.chomp.downcase
      break if item == "q"
      puts "Please enter the quanity of this item"
      qty = gets.chomp.downcase # default to 1 if blank string /
      break if qty == "q"
      order.create_order_item(menu_item: menu.m_items[item], quantity: qty)
      puts "When you've added all your items, please press Q to continue"
    end

    puts "Your order total is #{order.calculate_total}. If you're happy to proceed with this order, press 'y' to confirm. Otherwise press any other key to exit."
    input = gets.chomp.downcase
    if input == "y"
      puts "Great, thanks for your order! You'll receive a SMS confirmation."
      order.confirm
    end
    
  end
end
