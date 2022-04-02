require_relative 'order'
require_relative 'menu'
require_relative 'twilio'

class Takeaway

  attr_reader :order

  def initialize(order = Order.new, text_client = TwilioClient.new)
    @order = order
    @order_done = false
    @text_client = text_client
  end

  def take_order
    puts "Welcome to Su's takeaway"
    @order.show_menu
    puts "Please enter your 10 digit mobile number"
    number = STDIN.gets.chomp
    order_dish
    if @order_done == true
      confirm_order(number)
    else
      order_dish
    end
  end

  def order_dish
    @order_done = false
    puts "Please enter the number of the dish that you wish to order (leave blank to finish)"
    item_index = STDIN.gets.chomp
    while !item_index.empty? do
      item_index = item_index.to_i - 1 # minus 1 because menu is shown beginning from 1, index is from 0
      puts "You have ordered #{@order.dish_name(item_index)}. How many would you like? (Enter 0 or just press enter if you pressed the wrong number)"
      quantity = STDIN.gets.chomp.to_i
      puts "You have ordered #{quantity}x #{@order.dish_name(item_index)}." unless quantity == 0
      @order.add_to_order(item_index, quantity) unless quantity == 0
      puts "Please enter the number of the dish that you wish to order (leave blank to finish)"
      item_index = STDIN.gets.chomp
    end
    puts "You have ordered:"
    @order.item_list
    puts "Please type 'yes' to confirm this order"
    confirm = STDIN.gets.chomp
    @order_done = true if confirm.capitalize.downcase! == 'yes' #confirm.capitalize.downcase! so that it will accept 'yes' 'Yes' 'YEs' or any other capitalisation since if just downcase! then 'yes' will return error
  end

  def confirm_order(number)
    confirmation_text(number)
    @order.finish_order
  end

  private

  def confirmation_text(number)
    @text_client.send_text("+44" + number)
  end

end
