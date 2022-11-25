# frozen_string_literal: true

require_relative './FinishMyOrder'
require_relative './Menu'
require_relative './Order'
require_relative './Text'

class UserInterface
  def initialize
    @chinese_restaurant = [
      { name: 'Noodles', price: 12.00, quantity: 10 },
      { name: 'Egg Fried Rice', price: 10.00, quantity: 10 },
      { name: 'Chicken Satay', price: 6.00, quantity: 5 },
      { name: 'Prawn Toast', price: 2.00, quantity: 2 }
    ]
    @indian_restaurant = [
      { name: 'Chicken Korma', price: 9.00, quantity: 10 },
      { name: 'Chicken Tikka', price: 8.00, quantity: 10 },
      { name: 'Onion Bhaji', price: 3.00, quantity: 5 },
      { name: 'Naan Bread', price: 2.00, quantity: 2 }
    ]
  end

  def run
    puts 'Please choose a restaurant to order from:'
    puts 'Enter 1 to order from a burger place'
    puts 'Enter 2 to order chinese'
    puts 'Enter 3 to order indian'
    choice = gets.chomp.to_i
    case choice
    when 1
      menu = Menu.new
    when 2
      menu = Menu.new(Kernel, @chinese_restaurant)
    when 3
      menu = Menu.new(Kernel, @indian_restaurant)
    end
    my_order = Order.new(menu)
    puts 'Here is the menu:'
    menu.list_available
    loop do
      puts 'Enter what you would like to order - please type done once you are finished adding items to your order'
      item = gets.chomp
      break if item == 'done'

      puts 'Enter the quantity you would like to add to the order'
      quantity = gets.chomp.to_i
      my_order.add(item, quantity)
    end
    my_order.complete_order
  end
end

ui = UserInterface.new
ui.run
