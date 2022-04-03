require_relative 'order'
require_relative 'menu'
require_relative 'twilio'

class Takeaway

  def initialize(order = Order.new, text_client = TwilioClient.new)
    @order = order
    @order_done = false
    @text_client = text_client
  end

  def take_order
    puts "Welcome to Su's takeaway"
    take_number unless @order_done == true
    show_menu unless @order_done == true
    edit_order until @order_done == true
    cost
  end

  def place_order
    fail "You have not created an order yet" unless @order_done == true
    confirmation_text
    reset_order
  end

  def cancel_order
    @order = Order.new
    @order_done = false
    puts "Your order has been cancelled."
  end

  def show_menu
    @order.show_menu
  end

  def cost 
    @order.total_cost
  end

  private

  def take_number
    puts "Please enter your 10 digit mobile number"
    @number = STDIN.gets.chomp
  end

  def edit_order
    order_dish
    puts "You have ordered:"
    @order.item_list
    puts "Please type 'yes' to confirm this order. Type anything else to continue making additions"
    confirm = STDIN.gets.chomp
    @order_done = true if confirm.capitalize.downcase! == 'yes' 
    # capitalize.downcase! so that it will accept all capitalisations w/o raising error
  end

  def order_dish
    puts "Please enter the number of the dish that you wish to order (leave blank to finish)"
    item_index = STDIN.gets.chomp
    until item_index.empty? do
      item_index = item_index.to_i - 1 
      puts "You have ordered #{@order.dish_name(item_index)}. How many would you like?" 
      quantity = STDIN.gets.chomp.to_i
      @order.add_to_order(item_index, quantity) unless quantity.zero?
      puts "Please enter the number of the dish that you wish to order (leave blank to finish)"
      item_index = STDIN.gets.chomp
    end
  end

  def confirmation_text
    @text_client.send_text("+44" + @number)
  end

  def reset_order
    @order_done = false
    @number = nil
    @order.finish_order
  end
end
