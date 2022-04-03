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
    show_menu
    take_number
    edit_order until @order_done == true
    confirm_order
  end

  def confirm_order
    confirmation_text
    @order.finish_order
  end

  def show_menu
    @order.show_menu
  end

  def edit_order
    @order_done = false
    order_dish
    puts "You have ordered:"
    @order.item_list
    puts "Please type 'yes' to confirm this order"
    confirm = STDIN.gets.chomp
    @order_done = true if confirm.capitalize.downcase! == 'yes' 
    # capitalize.downcase! so that it will accept all capitalisations w/o raising error
  end

  private

  def take_number
    puts "Please enter your 10 digit mobile number"
    @number = STDIN.gets.chomp
  end

  def order_dish
    puts "Please enter the number of the dish that you wish to order (leave blank to finish)"
    item_index = STDIN.gets.chomp
    until item_index.empty? do
      item_index = item_index.to_i - 1 
      # minus 1 because menu is shown beginning from 1, index is from 0
      puts "You have ordered #{@order.dish_name(item_index)}." 
      puts "How many would you like? (Enter 0 or just press enter if you pressed the wrong number)"
      quantity = STDIN.gets.chomp.to_i
      puts "You have ordered #{quantity}x #{@order.dish_name(item_index)}." unless quantity.zero?
      @order.add_to_order(item_index, quantity) unless quantity.zero?
      puts "Please enter the number of the dish that you wish to order (leave blank to finish)"
      item_index = STDIN.gets.chomp
    end
  end

  def confirmation_text
    @text_client.send_text("+44" + @number)
  end

end
