require_relative 'menu'
require_relative 'calculator'
require_relative 'send_text'

require 'rubygems'
require 'twilio-ruby'

class Order

include Menu, Calculator, Send_text
attr_accessor :order_list

def initialize
  @order_list = {}
  display_menu
end

def display_menu
  PRICE_LIST.each_with_index {|(food, price), index| puts "#{index + 1} - #{food} : £#{price}0"}
end

def customer_selection
  @item = ""
  while @item != "exit"
    select_item
    break if @item == "exit"
    select_quantity  
    add_items
  end
  confirm_order
end
#to be updated for selection by menu number
#probably need to take out all the puts and getschomps for testing purposes...
def select_item
  puts "Please select an item from the menu. Type 'exit' to finish."
  @item = gets.chomp 
  menu_check
end

def menu_check
  until PRICE_LIST.keys.include? @item
    break if @item == "exit"
    puts "Your selection is not on the menu - please choose again."
    @item = gets.chomp
  end
end

def select_quantity
  puts "Quantity?"
  @quantity = gets.chomp
end

def add_items
  @order_list[@item] = @quantity
end

def confirm_order
  get_overall_price
  puts "The items ordered are #{@order_list}\n"
  puts "The overall price is £#{@overall_price}0 \n"
  puts "Enter 'yes' if you are happy to proceed"
  answer = gets.chomp
  (answer == "yes" || answer == "Yes") ? payment : return
end

def payment
  puts "Confirm payment amount:"
  payment = gets.chomp
  if payment.to_f == @overall_price
    send_text
  else puts "Wrong amount, please re-enter"
    confirm_order 
  end
end

def item_count
  @order_list.length
end

def selection(item, quantity)
  @item = item
  @quantity = quantity
  unless !PRICE_LIST.keys.include? @item
    add_items
  end
end

end